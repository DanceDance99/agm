class ReservationMailer < ActionMailer::Base
  default from: 'agmexpressproduction@gmail.com'

  def notify_on_new_reservation(tour, reservation)
    @tour = tour
    @reservation = reservation
    mail(to: 'tourbillontime@live.com', subject: 'New Tour Reservation')
  end

  def notify_customer_on_new_reservation(tour, reservation)
    @tour = tour
    @reservation = reservation
    mail(to: @reservation.email_address, subject: 'Tour Booking Confirmation')
  end
end
