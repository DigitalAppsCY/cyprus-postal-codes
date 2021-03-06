# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Paginator do
  subject(:paginator) do
    Class.new do
      include CyprusPostalCodes::Client::Paginator

      attr_reader :last_response

      def initialize(last_response_data = nil)
        @last_response = Struct.new(:body).new(last_response_data)
      end
    end
  end

  before { stub_const("Paginator", paginator) }

  describe "when using the addresses resource" do
    let(:addresses_paginator_data) do
      { "data" =>
        { "postal_code" => "1111",
          "language" => "el",
          "addresses" =>
          { "paginator" =>
            { "total_count" => "100",
              "total_pages" => "12",
              "tokens" =>
              { "next_page" => "next_page_token",
                "previous_page" => "previous_page_token",
                "first_page" => "first_page_token",
                "last_page" => "last_page_token" } } } } }
    end

    describe "next_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.next_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(addresses_paginator_data) }

        it "returns the next page token" do
          paginator_service = Paginator.new(addresses_paginator_data)

          expect(paginator_service.next_page).to eq("next_page_token")
        end
      end
    end

    describe "previous_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.previous_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(addresses_paginator_data) }

        it "returns the previous page token" do
          paginator_service = Paginator.new(addresses_paginator_data)

          expect(paginator_service.previous_page).to eq("previous_page_token")
        end
      end
    end

    describe "total_pages" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns zero" do
          expect(paginator_service.total_pages).to eq(0)
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(addresses_paginator_data) }

        it "returns the total_pages field value" do
          paginator_service = Paginator.new(addresses_paginator_data)

          expect(paginator_service.total_pages).to eq("12")
        end
      end
    end
  end

  describe "when using the areas resource" do
    let(:areas_paginator_data) do
      { "data" =>
        { "postal_code" => "1111",
          "language" => "el",
          "result" =>
          { "paginator" =>
            { "total_count" => "100",
              "total_pages" => "12",
              "tokens" =>
              { "next_page" => "next_page_token",
                "previous_page" => "previous_page_token",
                "first_page" => "first_page_token",
                "last_page" => "last_page_token" } } } } }
    end

    describe "next_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.next_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(areas_paginator_data) }

        it "returns the next page token" do
          paginator_service = Paginator.new(areas_paginator_data)

          expect(paginator_service.next_page).to eq("next_page_token")
        end
      end
    end

    describe "previous_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.previous_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(areas_paginator_data) }

        it "returns the previous page token" do
          paginator_service = Paginator.new(areas_paginator_data)

          expect(paginator_service.previous_page).to eq("previous_page_token")
        end
      end
    end

    describe "total_pages" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns zero" do
          expect(paginator_service.total_pages).to eq(0)
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(areas_paginator_data) }

        it "returns the total_pages field value" do
          paginator_service = Paginator.new(areas_paginator_data)

          expect(paginator_service.total_pages).to eq("12")
        end
      end
    end
  end

  describe "when using the search resource" do
    let(:search_paginator_data) do
      { "data" =>
        { "district" => "larnaka",
          "area" => nil,
          "param" => "arch",
          "language" => "el",
          "result" =>
          { "paginator" =>
            { "total_count" => "100",
              "total_pages" => "12",
              "tokens" =>
              { "next_page" => "next_page_token",
                "previous_page" => "previous_page_token",
                "first_page" => "first_page_token",
                "last_page" => "last_page_token" } } } } }
    end

    describe "next_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.next_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(search_paginator_data) }

        it "returns the next page token" do
          paginator_service = Paginator.new(search_paginator_data)

          expect(paginator_service.next_page).to eq("next_page_token")
        end
      end
    end

    describe "previous_page" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns nil" do
          expect(paginator_service.previous_page).to be nil
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(search_paginator_data) }

        it "returns the previous page token" do
          paginator_service = Paginator.new(search_paginator_data)

          expect(paginator_service.previous_page).to eq("previous_page_token")
        end
      end
    end

    describe "total_pages" do
      context "when there is no last response" do
        let(:paginator_service) { Paginator.new }

        it "returns zero" do
          expect(paginator_service.total_pages).to eq(0)
        end
      end

      context "when there is a last response" do
        let(:paginator_service) { Paginator.new(search_paginator_data) }

        it "returns the total_pages field value" do
          paginator_service = Paginator.new(search_paginator_data)

          expect(paginator_service.total_pages).to eq("12")
        end
      end
    end
  end
end
