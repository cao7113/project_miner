# Change this omniauth configuration to point to your registered provider

# Since this is a registered application, add the app id and secret here
Rails.application.config.middleware.use OmniAuth::Builder do
  provider UC_PROVIDER_NAME, UC_APP_ID, UC_APP_SECRET
end
