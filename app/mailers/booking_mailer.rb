class BookingMailer < ActionMailer::Base
  default from: 'agmecho@yahoo.com'

  def notify_on_new_booking(booking)
    @booking = booking
    mail(to: 'agmecho@yahoo.com', subject: 'New Shuttle Booking')
  end

  def notify_customer_on_new_booking(booking)
    @booking = booking
    mail(to: @booking.email_address, subject: 'Shuttle Booking Confirmation')
  end
end
