require "spec_helper"
require "hexpress/suffix/one"

describe Hexpress::Suffix::One do
  describe "#maybe" do
    it 'returns `(?:\w+)?`' do
      regex = Hexpress.new.maybe { words }.to_r
      expect(regex).to eq(/(?:(?:\w)+)?/)
    end

    it 'returns only ? if no value given`' do
      regex = Hexpress.new.with("foo").maybe.to_r
      expect(regex).to eq(/foo?/)
    end
  end

  describe "#operator" do
    it "returns the ? operator" do
      expect(described_class.new("foo").operator).to eq("?")
    end
  end
end
