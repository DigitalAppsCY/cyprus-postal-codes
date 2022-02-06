# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::GovernmentServices do
  describe "government_services" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::GovernmentServices

        def get(resource, options); end
      end
    end

    before { stub_const("GovernmentServicesClient", client) }

    let(:service) { GovernmentServicesClient.new }

    it "calls the `government-services` endpoint" do
      allow(service).to receive(:get)

      service.government_services(param: "arc")

      expect(service).to have_received(:get).with("government-services", param: "arc", lng: "el", district: nil,
                                                                         page_token: nil)
    end

    it "expects `district` to be set" do
      expect { service.government_services }.to raise_error(ArgumentError, "missing keyword: :param")
    end
  end
end
