require "spec_helper"

describe Hexpress do
  it "takes a block and turns into a regex" do
    pattern = Hexpress.new { find("foo") }
    expect(pattern.to_r).to eq(/(foo)/)
  end

  it "takes a chain and turns into a regex" do
    pattern = Hexpress.new.find("foo")
    expect(pattern.to_r).to eq(/(foo)/)
  end

  describe "#word" do
    it "returns the word matcher" do
      expect(Hexpress.new.word.to_s).to eq('\w')
    end
  end

  describe "#digit" do
    it "returns the digit matcher" do
      expect(Hexpress.new.digit.to_s).to eq('\d')
    end
  end

  describe "#space" do
    it "returns the whitespace matcher" do
      expect(Hexpress.new.space.to_s).to eq('\s')
    end
  end

  describe "#words" do
    it "returns the word and multiple matchers" do
      expect(Hexpress.new.words.to_s).to eq('(?:\w)+')
    end
  end

  describe "#digits" do
    it "returns the digit and multiple matchers" do
      expect(Hexpress.new.digits.to_s).to eq('(?:\d)+')
    end
  end

  describe "#spaces" do
    it "returns the whitespace and multiple matchers" do
      expect(Hexpress.new.spaces.to_s).to eq('(?:\s)+')
    end
  end

  describe "#nonword" do
    it "returns the nonword matcher" do
      expect(Hexpress.new.nonword.to_s).to eq('\W')
    end
  end

  describe "#nondigit" do
    it "returns the nondigit matcher" do
      expect(Hexpress.new.nondigit.to_s).to eq('\D')
    end
  end

  describe "#nonspace" do
    it "returns the nonwhitespace matcher" do
      expect(Hexpress.new.nonspace.to_s).to eq('\S')
    end
  end

  describe "#anything" do
    it "returns any with zero or more pattern wrapped in noncapute" do
      expect(Hexpress.new.anything.to_s).to eq('(?:.)*')
    end
  end
end
