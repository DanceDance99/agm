class BookingMailer < ActionMailer::Base
  default from: 'AGM Tours, Inc. agmecho@gmail.com'

  def notify_on_new_booking(booking)
    @booking = booking
    mail(to: 'agmecho@gmail.com', subject: 'New Shuttle Booking')
  end

  def notify_customer_on_new_booking(booking)
    @booking = booking
    mail(to: @booking.email_address, subject: 'AGM Tours, Inc - Shuttle Booking Confirmation')
  end
end
