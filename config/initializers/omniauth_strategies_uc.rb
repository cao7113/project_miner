require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
 module Strategies
   class Uc < OAuth2
    def initialize(app, api_key = nil, secret_key = nil, options = {}, &block)
      client_options = {
        :site =>  UC_PROVIDER_URL,
        :authorize_url => "#{UC_PROVIDER_URL}/auth/#{UC_PROVIDER_NAME}/authorize",
        :access_token_url => "#{UC_PROVIDER_URL}/auth/#{UC_PROVIDER_NAME}/access_token"
      }
      super(app, UC_PROVIDER_NAME.to_sym, api_key, secret_key, client_options, &block)
    end

protected      
    def user_data
      @data ||= MultiJson.decode(@access_token.get("/auth/#{UC_PROVIDER_NAME}/user.json"))
    end
      
    def request_phase
      options[:scope] ||= "read"
      super
    end

    def user_hash
      user_data
    end
      
    def auth_hash
      OmniAuth::Utils.deep_merge(super, {
          'provider'=>UC_PROVIDER_NAME,
          'uid' => user_data["uid"],
          'user_info' => user_data['user_info'],
          'extra' => user_data['extra']
      })
    end
   end
 end
end
