# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Districts
      def districts
        get("district-selection")
      end
    end
  end
end
