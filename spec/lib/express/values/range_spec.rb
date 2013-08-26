require "spec_helper"

describe Express::Values::Range do
  describe "#lower" do
    it "returns the lower character matcher" do
      expect(Express.new.lower.to_s).to eq("a-z")
    end
  end

  describe "#upper" do
    it "returns the upper character matcher" do
      expect(Express.new.upper.to_s).to eq("A-Z")
    end
  end

  describe "#letter" do
    it "returns the upper and lower character matchers" do
      expect(Express.new.letter.to_s).to eq("a-zA-Z")
    end
  end

  describe "#number" do
    it "returns the number matcher" do
      expect(Express.new.number.to_s).to eq("0-9")
    end
  end

  describe "#to_s" do
    it "returns two values joined by range matcher" do
      expect(described_class.new(0..9).to_s).to eq("0-9")
    end
  end
end
