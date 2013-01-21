# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :user_name => "got2surf@gmail.com",
   :password => "naran123"
   :enable_starttls_auto => true

 }

# Initialize the rails application
Biz::Application.initialize!

