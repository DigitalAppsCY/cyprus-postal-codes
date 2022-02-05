# frozen_string_literal: true

module CyprusPostalCodes
  class Client
    module PostOfficeBoxes
      def post_office_boxes(number:, page_token: nil)
        get("post-office-boxes", number: number, page_token: page_token)
      end
    end
  end
end
