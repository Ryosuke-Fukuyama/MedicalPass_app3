Recaptcha.configure do |config|
  config.site_key = ENV['RECAPTCHAV2_SITE_KEY']
  config.secret_key = ENV['RECAPTCHAV2_SECRET_KEY']
end
