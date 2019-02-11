class AttandantMailer < ApplicationMailer
  default from: 'no-reply@vive-rspec.fr'
 
  def new_attandant(event)
    @event = event 
    @url  = 'http://amortlestests.fr/login' 

    mail(to: @event.admin.email, subject: 'Vous avez un nouvel inscrit') 
  end
end