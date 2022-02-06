# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Areas do
  describe "areas" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::Areas

        def get(resource, options); end
      end
    end

    before { stub_const("AreasClient", client) }

    let(:service) { AreasClient.new }

    it "calls the `areas` endpoint" do
      allow(service).to receive(:get)

      service.areas(district: "lefkosia")

      expect(service).to have_received(:get).with("get-areas", district: "lefkosia", lng: "el", page_token: nil)
    end

    it "expects `district` to be set" do
      expect { service.areas }.to raise_error(ArgumentError, "missing keyword: :district")
    end
  end
end
