# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client do
  describe "initialize" do
    it "requires an api key" do
      expect { described_class.new }.to raise_error(ArgumentError, "missing keyword: :api_key")
    end
  end

  describe "get" do
    let(:connection) { instance_double(Faraday::Connection, get: Struct.new(:body).new({ data: "" })) }
    let(:service) { instance_double(described_class) }
    let(:params) { { post_code: 8020 } }

    it "calls the requested resource with the specified parameters" do
      allow(Faraday).to receive(:new).and_return(connection)
      allow(described_class).to receive(:initialize).and_return(service)

      described_class.new(api_key: "api_key").get("address", params)

      expect(connection).to have_received(:get).with("address", params)
    end
  end
end
