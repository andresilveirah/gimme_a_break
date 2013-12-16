OmniAuth.config.logger = Rails.logger
# by default, in development, OmniAuth raises an exception when there's a failure
# this snippet redirects to the failure route instead
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end