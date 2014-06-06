class BookingMailer < ActionMailer::Base
  default from: 'agmexpressproduction@gmail.com'

  def notify_on_new_booking(booking)
    @booking = booking
    mail(to: 'tourbillontime@live.com', subject: 'New Shuttle Booking')
  end
end
