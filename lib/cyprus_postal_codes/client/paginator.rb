# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Paginator
      def next_page
        paginator&.dig("tokens", "next_page")
      end

      def previous_page
        paginator&.dig("tokens", "previous_page")
      end

      def total_pages
        paginator&.fetch("total_pages") || 0
      end

      private

      RESOURCE_INDEX = 2

      def paginator
        @paginator = last_response&.body&.dig("data", resource, "paginator")
      end

      def resource
        last_response&.body&.dig("data")&.keys&.fetch(RESOURCE_INDEX)
      end
    end
  end
end
