# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client::PostOfficeBoxes do
  describe "post_office_boxes" do
    subject(:client) do
      Class.new do
        include CyprusPostalCodes::Client::PostOfficeBoxes

        def get(resource, options); end
      end
    end

    before { stub_const("PostOfficeBoxesClient", client) }

    let(:service) { PostOfficeBoxesClient.new }

    it "calls the `post-office-boxes` endpoint" do
      allow(service).to receive(:get)

      service.post_office_boxes(number: 12_220)

      expect(service).to have_received(:get).with("post-office-boxes", number: 12_220, page_token: nil)
    end

    it "expects `number` to be set" do
      expect { service.post_office_boxes }.to raise_error(ArgumentError, "missing keyword: :number")
    end
  end
end
