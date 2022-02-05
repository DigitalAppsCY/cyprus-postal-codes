# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::Search do
  describe "search" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::Search

        def get(resource, options); end
      end
    end

    before { stub_const("SearchClient", client) }

    let(:service) { SearchClient.new }

    it "calls the `search` endpoint" do
      allow(service).to receive(:get)

      service.search(district: "lefkosia", param: "arch")

      expect(service).to have_received(:get).with("search", district: "lefkosia", param: "arch", area: nil,
                                                            page_token: nil)
    end

    it "expects `district` and `param` to be set" do
      expect { service.search }.to raise_error(ArgumentError, "missing keywords: :district, :param")
    end

    it "expects `district` to be set" do
      expect { service.search(param: "arch") }.to raise_error(ArgumentError, "missing keyword: :district")
    end

    it "expects `param` to be set" do
      expect { service.search(district: "lefkosia") }.to raise_error(ArgumentError, "missing keyword: :param")
    end
  end
end
