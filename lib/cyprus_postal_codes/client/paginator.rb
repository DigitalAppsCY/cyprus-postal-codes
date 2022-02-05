# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module Paginator
      RESOURCES = %w[addresses result].freeze
      private_constant :RESOURCES

      def next_page
        paginator&.dig("tokens", "next_page")
      end

      def previous_page
        paginator&.dig("tokens", "previous_page")
      end

      def first_page
        paginator&.dig("tokens", "first_page")
      end

      def last_page
        paginator&.dig("tokens", "last_page")
      end

      def total_pages
        paginator&.fetch("total_pages") || 0
      end

      def total_count
        paginator&.fetch("total_count") || 0
      end

      private

      def paginator
        @paginator = last_response&.body&.dig("data", resource&.join, "paginator")
      end

      def resource
        last_response&.body&.dig("data")&.keys & RESOURCES
      end
    end
  end
end
