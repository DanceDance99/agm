class ReservationMailer < ActionMailer::Base
  default from: 'AGM Tours, Inc. agmecho@gmail.com'

  def notify_on_new_reservation(tour, reservation)
    @tour = tour
    @reservation = reservation
    #attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    mail(to: 'hi@sponsi.com', subject: 'New Tour Reservation')
  end

  def notify_customer_on_new_reservation(tour, reservation)
    @tour = tour
    @reservation = reservation
    #attachments.inline['logo.png'] = File.read("#{Rails.root.to_s + '/app/assets/images/logo.png'}")
    mail(to: @reservation.email_address, subject: 'AGM Tours, Inc. - Tour Booking Confirmation')
  end
end
