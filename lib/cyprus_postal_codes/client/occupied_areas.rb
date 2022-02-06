# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module OccupiedAreas
      def occupied_areas(lng: "el", district: nil, param: nil, page_token: nil)
        get("occupied-areas", lng: lng, district: district, param: param, page_token: page_token)
      end
    end
  end
end
