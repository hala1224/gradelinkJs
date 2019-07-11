OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]
  # OmniAuth.config.on_failure = Proc.new do |env|
  #     #this will invoke the omniauth_failure action in SessionsController.
  #     "SessionsController".constantize.action(:omniauth_failure).call(env)
  #   end
 provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true


end
