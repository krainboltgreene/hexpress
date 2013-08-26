require "spec_helper"

describe Express::Value::With do
  describe "#to_s" do
    it "returns the string given" do
      expect(described_class.new("foo").to_s).to eq("foo")
    end
  end
end
