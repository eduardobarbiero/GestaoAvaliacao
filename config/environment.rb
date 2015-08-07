# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.default_url_options[:host] = "gmail.com"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings =
{
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :user_name => "meustestepedidos@gmail.com",
    :password => "gestaoavaliacao",
    :authentication       => :plain,
    :enable_starttls_auto => true,
    :openssl_verify_mode  => 'none'
}