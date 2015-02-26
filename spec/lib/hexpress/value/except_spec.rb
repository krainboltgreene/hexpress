require "spec_helper"
require "hexpress/value/except"

describe Hexpress::Value::Except do
  describe "#to_s" do
    it "returns the not marker followed by the value" do
      expect(described_class.new("f").to_s).to eq("^f")
    end
  end
end
