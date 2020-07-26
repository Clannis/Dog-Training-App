Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end