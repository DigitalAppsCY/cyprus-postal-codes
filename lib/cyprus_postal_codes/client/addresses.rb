# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Addresses
      def addresses(post_code:, page_token: nil)
        get("addresses", postal_code: post_code, page_token: page_token)
      end
    end
  end
end
