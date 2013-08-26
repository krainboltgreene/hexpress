require "spec_helper"

describe Express::Value::Starting do
  describe "#to_s" do
    it "returns the start of string pattern" do
      expect(described_class.new.to_s).to eq("$")
    end

    it "has the given string after the start of string pattern" do
      expect(described_class.new("foo").to_s).to eq("$foo")
    end
  end
end
