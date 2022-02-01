module CyprusPostalCodes
  class Client
    module Search
      def search(param:, district:, area: nil)
        get('search', param: param, district: district, area: area)
      end
    end
  end
end
