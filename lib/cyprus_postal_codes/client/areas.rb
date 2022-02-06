# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Areas
      def areas(district:, lng: "el", page_token: nil)
        get("get-areas", district: district, lng: lng, page_token: page_token)
      end
    end
  end
end
