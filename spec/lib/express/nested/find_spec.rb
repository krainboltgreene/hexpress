require "spec_helper"

describe Express::Nested::Find do
  describe "#to_s" do
    it "returns a capture of the expression" do
      expect(described_class.new { word }.to_s ).to eq('(\w)')
    end

    it "returns a capture of the string" do
      expect(described_class.new("foo").to_s ).to eq('(foo)')
    end
  end
end
