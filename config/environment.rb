# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

  config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp

    ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'thpotins.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}