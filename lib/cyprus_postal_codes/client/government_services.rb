# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module GovernmentServices
      def government_services(param:, district: nil, page_token: nil)
        get("government-services", param: param, district: district, page_token: page_token)
      end
    end
  end
end
