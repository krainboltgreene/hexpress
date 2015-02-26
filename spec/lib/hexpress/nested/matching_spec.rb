require "spec_helper"
require "hexpress/nested/matching"

describe Hexpress::Nested::Matching do
  describe "#hexpression" do
    it "escapes strings" do
      expect(described_class.new { [word, "-"] }.to_s).to eq('[\w\-]')
    end
  end

  describe "#to_s" do
    it "returns the instance of hexpressions and wraps them in []" do
      expect(described_class.new { word }.to_s).to eq('[\w]')
    end
  end
end
