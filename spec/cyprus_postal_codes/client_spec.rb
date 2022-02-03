# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client do
  describe "initialize" do
    it "requires an api key" do
      expect { described_class.new }.to raise_error(ArgumentError, "missing keyword: :api_key")
    end
  end

  describe "get" do
    let(:connection) { instance_double(Faraday::Connection, get: Struct.new(:body).new({ data: "" })) }

    before do
      allow(Faraday).to receive(:new).and_return(connection)
    end

    context "when language param is not initialize it has el as default " do
      let(:params) { { post_code: 8020, lng: "el" } }

      it "calls the requested resource with the specified parameters" do
        described_class.new(api_key: "api_key").get("address", params)

        expect(connection).to have_received(:get).with("address", params)
      end
    end

    context "when language param is not initialize it uses el as default" do
      let(:params) { { post_code: 8020, lng: "en" } }

      it "calls the requested resource with the specified parameters" do
        described_class.new(api_key: "api_key", lng: "en").get("address", params)

        expect(connection).to have_received(:get).with("address", params)
      end
    end
  end
end
