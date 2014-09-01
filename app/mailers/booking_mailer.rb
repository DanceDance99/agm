class BookingMailer < ActionMailer::Base
  default from: 'agmecho@gmail.com'

  def notify_on_new_booking(booking)
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    @booking = booking
    mail(to: 'agmecho@gmail.com', subject: 'New Shuttle Booking')
  end

  def notify_customer_on_new_booking(booking)
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    @booking = booking
    mail(to: @booking.email_address, subject: 'AGM Tours, Inc - Shuttle Booking Confirmation')
  end
end
