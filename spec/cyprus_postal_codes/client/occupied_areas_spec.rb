# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::OccupiedAreas do
  describe "occupied_areas" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::OccupiedAreas

        def get(resource, options); end
      end
    end

    before { stub_const("OccupiedAreasClient", client) }

    let(:service) { OccupiedAreasClient.new }

    it "calls the `occupied-areas` endpoint" do
      allow(service).to receive(:get)

      service.occupied_areas

      expect(service).to have_received(:get).with("occupied-areas", district: nil, param: nil, page_token: nil)
    end
  end
end
