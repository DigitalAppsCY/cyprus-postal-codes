module CyprusPostalCodes
  class Client
    module AddressesPaginator

    private
      def next_page
        paginator['tokens']['next_page']
      end

      def previous_page
        paginator['tokens']['next_page']
      end

      def total_pages
        paginator['total_pages']
      end

      def paginator
        @paginator = last_response.body['data']['addresses']['paginator']
      end
    end
  end
end
