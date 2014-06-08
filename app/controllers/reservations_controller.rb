class ReservationsController < ApplicationController
  before_action :require_admin
  before_action :load_tour, only: [:index, :new, :create]

  layout 'admin'

  def new
    @reservation = Reservation.new
    @tour_dates = @tour.tour_dates.where(:date => Date.today .. 1.month.from_now).where("available > 0").order('date asc')
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.tour = @tour
    @reservation.token = params[:stripeToken]
    @tour_dates = @tour.tour_dates.where(:date => Date.today .. 1.month.from_now).where("available > 0").order('date asc')

    @tour.amount = @reservation.passengers * @tour.amount


    if @reservation.save
      ReservationMailer.notify_customer_on_new_reservation(@tour, @reservation).deliver
      ReservationMailer.notify_on_new_reservation(@tour, @reservation).deliver
      flash[:success] = "Your reservation has been booked! You will receive an email confirmation soon."
      render :js => "window.location = '#{url_for(@tour)}'"
    else
      render action: 'create_failed'
    end
  end

  def index
    @reservations = @tour.reservations.order('date desc')
  end

  private

  def load_tour
    @tour = Tour.find(params[:tour_id])
  end

  # convert start date to Date format
  def convert_date(date)
    d = date.split('/')
    "#{d[2]}-#{d[0]}-#{d[1]}".to_date
  end

  def add_all_tour_days(start_tour_date)
    mdays = []  # array of matching days for 1st week
    tdays = {}
    @all_tour_days = []

    @tour.days.each do |tday|
      tdays[tday] = false
    end

    7.times do |i|
      date = start_tour_date.advance(days: i)
      dow = Date::ABBR_DAYNAMES[date.wday]
      next if tdays[dow].nil?
      # we've found a new tour day
      if !tdays[dow]
        tdays[dow] = true # we've checked it
        mdays << date
      end
    end

    mdays.each do |date|
      4.times do |i|
        @all_tour_days << date.advance(weeks: i).inspect
      end
    end
  end

  def reservation_params
    params.require(:reservation).permit(:passengers, :telephone_number, :hotel_name, :first_last_name, :email_address, :date, :added_by_admin)
  end
end

