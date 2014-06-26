class Reservation < ActiveRecord::Base
  belongs_to :tour

  after_create :decrement_tour_date
  after_create :charge_credit_card

  validates :passengers, :presence => true
  validates :tour, :presence => true
  validates :first_last_name, :presence => true
  validates :pickup_location, :presence => true
  validates :telephone_number, :presence => true
  validates :email_address, :presence => true

  attr_accessor :token

  protected

  def decrement_tour_date
    tour_date = self.tour.tour_dates.where(:date => self.date).first
    tour_date.decrement!(:available, self.passengers)
  end

  def charge_credit_card
    unless self.added_by_admin
      begin
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        Stripe::Charge.create(
          :amount => self.tour.amount, # amount in cents, again
          :currency => "usd",
          :card => self.token
        )

      rescue Stripe::CardError => e
        errors.add(:credit_card, e.message)
      end

    end
  end
end
