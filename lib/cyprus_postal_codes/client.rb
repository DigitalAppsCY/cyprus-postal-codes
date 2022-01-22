# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module CyprusPostalCodes
  class Client
    BASE_URL = "https://cypruspost.post/api/postal-codes/"

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.adapter adapter
        conn.request :json
        conn.response :json, content_type: "application/json"
      end
    end

    def inspect
      "#<CyprusPostalCodes::Client>"
    end
  end
end
