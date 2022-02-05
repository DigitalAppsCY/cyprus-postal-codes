# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module CyprusPostalCodes
  class Client
    include Addresses
    include Areas
    include Districts
    include GovernmentServices
    include OccupiedAreas
    include Paginator
    include Parcel24Locations
    include PostOfficeBoxes
    include Search

    BASE_URL = "https://cypruspost.post/api/postal-codes/"
    private_constant :BASE_URL

    def initialize(api_key:, lng: "el")
      @api_key = api_key
      @lng = lng
    end

    def get(resource, options = {})
      @last_response = connection.get(resource, options.merge(default_params))
      @last_response.body["data"]
    end

    def last_response
      @last_response if defined?(@last_response)
    end

    private

    attr_reader :api_key, :lng

    def default_params
      { lng: lng }
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.headers["Authorization"] = api_key
        conn.adapter Faraday.default_adapter
        conn.request :json
        conn.response :json, content_type: "application/json"
      end
    end
  end
end
