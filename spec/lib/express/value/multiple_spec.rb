require "spec_helper"

describe Express::Value::Multiple do
  describe "#to_s" do
    it "returns the one or more matcher" do
      expect(described_class.new.to_s).to eq("+")
    end

    it "puts the string before the one or more matcher" do
      expect(described_class.new("f").to_s).to eq("f+")
    end
  end
end
