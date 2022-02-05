# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Search
      def search(district:, param:, area: nil, page_token: nil)
        get("search", district: district, param: param, area: area, page_token: page_token)
      end
    end
  end
end
