class Booking < ActiveRecord::Base
  belongs_to :shuttle

  belongs_to :from, :class_name => "ShuttleCity"
  belongs_to :to, :class_name => "ShuttleCity"

  before_create :compute_amount
  after_create :charge_credit_card
  after_create :decrement_shuttle_legs

  validates :shuttle_id, :presence => true
  validates :to_id, :presence => true
  validates :from_id, :presence => true
  validates :depart_date, :presence => true
  validates :passengers, :presence => true
  validates :email_address, :presence => true
  validates :telephone_number, :presence => true
  validate :address_fields_status

  default_value_for :round_trip, false

  attr_accessor :token

  def shuttle_legs_departing
    legs = self.shuttle.shuttle_legs.where(:from_id => from, :date => self.depart_date)
    current_city = to.position > from.position ? from.lower_item : from.higher_item

    #intersect the set of dates that match for each leg of the journey if there are multiple legs
    while( current_city && current_city != to )
      legs << self.shuttle.shuttle_legs.where(:from_id => current_city, :date => self.depart_date).first
      current_city = to.position > from.position ? current_city.lower_item : current_city.higher_item

    end

    legs
  end

  def shuttle_legs_returning
    legs = self.shuttle.shuttle_legs.where(:from_id => to, :date => self.return_date)
    current_city = to.position > from.position ? to.higher_item : to.lower_item

    #intersect the set of dates that match for each leg of the journey if there are multiple legs
    while( current_city && current_city != from )
      legs << self.shuttle.shuttle_legs.where(:from_id => current_city, :date => self.return_date).first
      current_city = to.position > from.position ? current_city.higher_item : current_city.lower_item
    end

    legs
  end


  protected

  def compute_amount

    if self.private_shuttle?
      self.amount = self.round_trip? ? self.shuttle.group_round_trip_amount : self.shuttle.group_amount
    else
      #compute base fee for trip
      rate = self.round_trip? ? self.shuttle.round_trip_amount : self.shuttle.amount
      self.amount = self.passengers * rate

      #compute home pickup fees with discount for senior citizens
      home_fee = self.senior_citizen? ? 1000 : 1500
      self.amount += home_fee if self.home_pickup?
      self.amount += home_fee if self.home_dropoff?
    end

  end

  def decrement_shuttle_legs

    if self.private_shuttle?
      shuttle_legs_departing.each { |leg| leg.update_attribute(:available, 0) }
      if(self.round_trip)
        shuttle_legs_returning.each { |leg| leg.update_attribute(:available, 0) }
      end

    else
      shuttle_legs_departing.each { |leg| leg.decrement!(:available, self.passengers) }
      if(self.round_trip)
        shuttle_legs_returning.each { |leg| leg.decrement!(:available, self.passengers) }
      end
    end
  end

  def charge_credit_card
    unless self.added_by_admin
      begin
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        Stripe::Charge.create(
          :amount => self.amount,
          :currency => "usd",
          :card => self.token
        )
      rescue Stripe::CardError => e
        errors.add(:credit_card, e.message)
      #rescue => e

      end
    end

  end

  def address_fields_status
    if self.home_pickup
      errors.add(:home_address, "should be there") if self.home_address.nil? || self.home_address.blank?
      errors.add(:zipcode, "can't be blank")  if self.zipcode.nil? || self.zipcode.blank?

      if self.round_trip
        errors.add(:round_trip_source_address, "should be there") if self.round_trip_source_address.nil? || self.round_trip_source_address.blank?
        errors.add(:round_trip_source_zipcode, "can't be blank")  if self.round_trip_source_zipcode.nil? || self.round_trip_source_zipcode.blank?
      end
    end

    if self.home_dropoff
      errors.add(:dest_address, "should be there") if self.dest_address.nil? || self.dest_address.blank?
      errors.add(:dest_zipcode, "can't be blank")  if self.dest_zipcode.nil? || self.dest_zipcode.blank?

      if self.round_trip
        errors.add(:round_trip_dest_address, "should be there") if self.round_trip_dest_address.nil? || self.round_trip_dest_address.blank?
        errors.add(:round_trip_dest_zipcode, "can't be blank")  if self.round_trip_dest_zipcode.nil? || self.round_trip_dest_zipcode.blank?
      end
    end
  end
end
