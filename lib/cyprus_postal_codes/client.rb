# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

require 'cyprus_postal_codes/client/addresses'
require 'cyprus_postal_codes/client/addresses_paginator'
require 'cyprus_postal_codes/client/districts'
require 'cyprus_postal_codes/client/areas'
require 'cyprus_postal_codes/client/search'
require 'cyprus_postal_codes/client/government_services'

module CyprusPostalCodes
  class Client

    include CyprusPostalCodes::Client::Addresses
    include CyprusPostalCodes::Client::AddressesPaginator
    include CyprusPostalCodes::Client::Districts
    include CyprusPostalCodes::Client::Areas
    include CyprusPostalCodes::Client::Search
    include CyprusPostalCodes::Client::GovernmentServices

    BASE_URL = "https://cypruspost.post/api/postal-codes/"

    attr_reader :api_key, :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
      @api_key = ENV["CYPRUS_POSTAL_CODES_API_KEY"]
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.adapter adapter
        conn.request :json
        conn.response :json, content_type: "application/json"
      end
    end

    def get(resource, options = {})
      @last_response = connection.get(resource, options) do |request|
        request.headers["Authorization"] = api_key
      end
      @last_response.body['data']
    end

    def last_response
      @last_response if defined?(@last_response)
    end

    def inspect
      "#<CyprusPostalCodes::Client>"
    end
  end
end
