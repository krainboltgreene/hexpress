require "spec_helper"

describe Express::Value::Maybe do
  describe "#to_s" do
    it "should return a non-capture with none or one check" do
      expect(described_class.new("foo").to_s).to eq("(?:foo)?")
    end
  end
end
