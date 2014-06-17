class BookingsController < ApplicationController
  before_action :require_admin
  before_filter :load_shuttle

  layout 'admin'

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.shuttle = @shuttle
    @booking.token = params[:stripeToken] #this is not persisted, just used in a callback

    if @booking.save
      BookingMailer.notify_customer_on_new_booking(@booking).deliver
      BookingMailer.notify_on_new_booking(@booking).deliver
      flash[:success] = "Your shuttle has been booked! You will receive an email confirmation soon."
      render :js => "window.location = '#{url_for(@shuttle)}'"

    else
      render action: 'create_failed'
    end
  end

  def show
    render :layout => 'application'
  end

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today.beginning_of_week
  end


  # Returns dates available for given booking params (which will include number of passengers, from city, to city, and if round_trip)
  def dates
    @booking = Booking.new(booking_params)
    @from = @shuttle.shuttle_cities.find(params[:booking][:from_id])
    @to = @shuttle.shuttle_cities.find(params[:booking][:to_id])

    @depart_dates = []
    @return_dates = []

    if @from != @to

      passengers = @booking.private_shuttle? ? 11 : @booking.passengers

      @depart_dates = @shuttle.dates_for_journey(@from, @to, passengers)
      if @booking.round_trip
        date_range = @booking.depart_date ? (@booking.depart_date + 1)..(@booking.depart_date + 6.months) : Date.today..6.months.from_now
        @return_dates = @shuttle.dates_for_journey(@to, @from, passengers)
      end
    end
  end

  private

  def load_shuttle
    @shuttle = Shuttle.find_by_id(params[:shuttle_id])
  end

  def booking_params
    params.require(:booking).permit( :passengers, :home_pickup, :home_dropoff, :email_address, :home_address, :zipcode, :telephone_number, :amount, :first_last_name, :phone_number, :round_trip, :from_id, :to_id, :depart_date, :return_date, :added_by_admin, :private_shuttle, :senior_citizen)
  end
end
