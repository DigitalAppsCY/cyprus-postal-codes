# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Addresses
      def addresses(post_code:, lng: "el", page_token: nil)
        get("addresses", postal_code: post_code, lng: lng, page_token: page_token)
      end
    end
  end
end
