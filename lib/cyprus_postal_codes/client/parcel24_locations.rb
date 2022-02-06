# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Parcel24Locations
      def parcel24_locations(lng: "el", district: nil, param: nil, page_token: nil)
        get("parcel24-locations", lng: lng, district: district, param: param, page_token: page_token)
      end
    end
  end
end
