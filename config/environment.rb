# Load the rails application
require File.expand_path('../application', __FILE__)



 require 'tlsmail' #key but not always described
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  #this is the important stuff!
  :address        => 'smtp.gmail.com',
  :port           => 587,
  :domain         => 'gmail.com',
  :authentication => :plain,
  :user_name      => 'trybutucu@gmail.com',
  :password       => 'crimsonbutucu'
    }

# Initialize the rails application
Biz::Application.initialize!

