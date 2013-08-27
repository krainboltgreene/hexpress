require "spec_helper"

describe Express::Value::Ending do
  describe "#to_s" do
    it "returns the end of string pattern" do
      expect(described_class.new.to_s).to eq("$")
    end

    it "has the given string before the end of string pattern" do
      expect(described_class.new("foo").to_s).to eq("foo$")
    end
  end
end
