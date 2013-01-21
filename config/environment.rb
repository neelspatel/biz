# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Biz::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "npatel@college.harvard.edu",
   :password => "1613ononNARAN123"
 }