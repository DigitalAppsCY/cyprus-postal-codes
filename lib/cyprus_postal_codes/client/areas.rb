module CyprusPostalCodes
  class Client
    module Areas
      def areas(district:)
        get('get-areas', district: district)
      end
    end
  end
end
