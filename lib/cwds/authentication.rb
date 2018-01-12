require "cwds/authentication/version"
require 'faraday'

module Cwds
  module Authentication

    def self.token_validation(token, authentication_api_base_url)
      puts 'token validation method'

      token.present? && Faraday.get(token_validation_url(token, authentication_api_base_url)).status == 200

    end

    def self.token_generation(accessCode, authentication_api_base_url)
      puts 'gets token from perry'
      return unless accessCode.present?
      token_response = Faraday.get(token_generation_url(accessCode, authentication_api_base_url)) if accessCode.present? 
      token_response.body if token_response.status == 200      
    end

    def self.store_user_details_from_token(token)
      return unless token.present?
      user_details_repsonse = Faraday.get(token_validation_url(token, AUTHENTICATION_API_BASE_URL))
      user_details_repsonse.body   if user_details_repsonse.status == 200
    end

    def self.token_generation_url(accessCode, authentication_api_base_url)
      "#{authentication_api_base_url}/authn/token?accessCode=#{accessCode}"
    end

    
    def self.token_validation_url(token, authentication_api_base_url)
      "#{authentication_api_base_url}/authn/validate?token=#{token}"
    end

    def self.authentication_url(authentication_api_base_url, callback_url)
      "#{authentication_api_base_url}/authn/login?callback=#{callback_url}"
    end

    def self.logout_url(authentication_api_base_url,callback_url)
      "#{authentication_api_base_url}/authn/logout?callback=#{callback_url}"
    end

  end
end
