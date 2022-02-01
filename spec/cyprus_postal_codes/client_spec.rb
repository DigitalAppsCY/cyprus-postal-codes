# frozen_string_literal: true

RSpec.describe CyprusPostalCodes::Client do
  describe "initialize" do
    it "requires an api key" do
      expect { described_class.new }.to raise_error(ArgumentError, "missing keyword: :api_key")
    end
  end
end
