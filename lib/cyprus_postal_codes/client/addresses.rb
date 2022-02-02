# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Addresses
      def addresses(post_code:)
        get("addresses", postal_code: post_code)
      end
    end
  end
end
