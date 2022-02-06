# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module GovernmentServices
      def government_services(param:, lng: "el", district: nil, page_token: nil)
        get("government-services", param: param, lng: lng, district: district, page_token: page_token)
      end
    end
  end
end
