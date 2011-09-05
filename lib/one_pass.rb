require 'omniauth/core'
require 'multi_json'


module OmniAuth
  module Strategies
  
    class OnePass
	  include OmniAuth::Strategy
	  
	  def initialize(app, api_key = nil, secret_key = nil, options = {}, &block)
      client_options = {
        :site => CUSTOM_PROVIDER_URL,
        :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/one_pass/authorize",
        :access_token_url => "#{CUSTOM_PROVIDER_URL}/auth/one_pass/access_token"
      }
      super(app, :one_pass, api_key, secret_key, client_options, &block)
    end
	
	 def user_data
      @data ||= MultiJson.decode(@access_token.get("/auth/one_pass/user.json"))
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
          'uid' => user_data["uid"],
          'user_info' => user_data['user_info'],
          'extra' => {
              'first_name' => user_data['extra']['first_name'],
              'last_name' => user_data['extra']['last_name'],
          }
      })
    end
	
	end
	
  end
end