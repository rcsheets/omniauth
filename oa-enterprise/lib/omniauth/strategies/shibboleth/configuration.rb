require 'rack'

module OmniAuth
  module Strategies
    class Shibboleth
      class Configuration

        DEFAULT_UID_ATTRIBUTE = 'eppn'

        attr_reader :uid_attribute, :extra_attributes
        
        # @param [Hash] params configuration options
        # Shibboleth authentication is basically processed by SP. In OmniAuth Shibboleth Strategy, we mainly focus on attribute processing. The attribute names passed by SP is defined in shibd configuration file 'attribute-map.xml'.
        # @option params [String, nil] :uid_attribute specifies SAML attribute name used as uid, e.g. eppn (eduPersonPrincipalName).
        # @option params [Array, nil] :extra_attributes specifies SAML attribute names obtained from environment variables and set to omni_hash extra field.
        # Example:
        #   :extra_attributes => ['affiliation', 'unscoped-affiliation', 'entitlement', 'organization']
        def initialize(params)
          parse_params params
        end

        private

        def parse_params(params)
          if params[:uid_attribute].nil?
            raise ArgumentError.new(":uid_attribute MUST be provided")
          end
          @uid_attribute ||= params[:uid_attribute] || DEFAULT_UID_ATTRIBUTE
          @extra_attributes ||= params[:extra_attributes]
        end

      end
    end
  end
end
