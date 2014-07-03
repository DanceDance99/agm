class ReservationMailer < ActionMailer::Base
  default from: 'agmecho@gmail.com'

  def notify_on_new_reservation(tour, reservation)
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    @tour = tour
    @reservation = reservation
    mail(to: 'tourbillontime@live.com', subject: 'New Tour Reservation')
  end

  def notify_customer_on_new_reservation(tour, reservation)
    attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    @tour = tour
    @reservation = reservation
    mail(to: @reservation.email_address, subject: 'AGM Tours, Inc. - Tour Booking Confirmation')
  end
end
