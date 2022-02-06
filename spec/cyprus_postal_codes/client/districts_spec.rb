# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Districts do
  describe "districts" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::Districts

        def get(resource, options); end
      end
    end

    before { stub_const("DistrictClient", client) }

    let(:service) { DistrictClient.new }

    it "calls the `district-selection` endpoint" do
      allow(service).to receive(:get)

      service.districts

      expect(service).to have_received(:get).with("district-selection", lng: "el")
    end
  end
end
