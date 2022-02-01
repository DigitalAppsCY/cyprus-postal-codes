module CyprusPostalCodes
  class Client
    module Addresses
      def addresses(post_code:)
        get('addresses', postal_code: post_code, page_token: page_token)
      end
    end
  end
end
