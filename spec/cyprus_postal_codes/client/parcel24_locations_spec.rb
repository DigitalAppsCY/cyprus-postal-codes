# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Parcel24Locations do
  describe "parcel24_locations" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::Parcel24Locations

        def get(resource, options); end
      end
    end

    before { stub_const("Parcel24LocationsClient", client) }

    let(:service) { Parcel24LocationsClient.new }

    it "calls the `parcel24-locations` endpoint" do
      allow(service).to receive(:get)

      service.parcel24_locations

      expect(service).to have_received(:get).with("parcel24-locations", district: nil, param: nil, page_token: nil)
    end
  end
end
