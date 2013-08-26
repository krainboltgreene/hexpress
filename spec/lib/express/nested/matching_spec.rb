require "spec_helper"

describe Express::Nested::Matching do
  describe "#to_s" do
    it "returns the instance of expressions and wraps them in []" do
      expect(described_class.new { word }.to_s).to eq('[\w]')
    end
  end
end
