module CyprusPostalCodes
  class Client
    module GovernmentServices
      def government_services(param:, district:, area: nil)
        get('government-services', param: param, district: district)
      end
    end
  end
end
