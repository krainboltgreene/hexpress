require "spec_helper"

describe Express::Values::Either do
  describe "#to_s" do
    it "returns items delimited by or matcher inside non-capture group" do
      expect(described_class.new("foo", "bar").to_s).to eq("(?:foo|bar)")
    end
  end
end
