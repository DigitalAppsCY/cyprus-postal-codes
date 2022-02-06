# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Addresses do
  describe "addresses" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::Addresses

        def get(resource, options); end
      end
    end

    before { stub_const("AddressClient", client) }

    let(:service) { AddressClient.new }

    it "calls the `addresses` endpoint" do
      allow(service).to receive(:get)

      service.addresses(post_code: 8020)

      expect(service).to have_received(:get).with("addresses", postal_code: 8020, lng: "el", page_token: nil)
    end

    it "expects `post_code` to be set" do
      expect { service.addresses }.to raise_error(ArgumentError, "missing keyword: :post_code")
    end
  end
end
