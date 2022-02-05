# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Search
      def search(district:, param:, area: nil)
        get("search", district: district, param: param, area: area)
      end
    end
  end
end
