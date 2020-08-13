Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    # provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end