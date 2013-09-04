require "spec_helper"

describe Hexpress::Value::With do
  describe "#to_s" do
    it "returns the string given" do
      expect(described_class.new("foo").to_s).to eq("foo")
    end

    it "allows composing of multiple patterns" do
      pattern1 = Hexpress.new.starting("foo")
      pattern2 = Hexpress.new.ending("bar")
      pattern3 = Hexpress.new.including(pattern1).with("1").including(pattern2)
      expect(pattern3.to_r).to eq(/^foo1bar$/)
    end
  end
end
