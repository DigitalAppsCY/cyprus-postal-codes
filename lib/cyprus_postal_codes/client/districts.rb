# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Districts
      def districts(lng: "el")
        get("district-selection", lng: lng)
      end
    end
  end
end
