require "spec_helper"

describe Express do
  it "takes a block and turns into a regex" do
    pattern = Express.new { find("foo") }
    expect(pattern.to_r).to eq(/(foo)/)
  end

  it "takes a chain and turns into a regex" do
    pattern = Express.new.find("foo")
    expect(pattern.to_r).to eq(/(foo)/)
  end

  describe "#word" do
    it "returns the word matcher" do
      expect(Express.new.word.to_s).to eq('\w')
    end
  end

  describe "#digit" do
    it "returns the digit matcher" do
      expect(Express.new.digit.to_s).to eq('\d')
    end
  end

  describe "#space" do
    it "returns the whitespace matcher" do
      expect(Express.new.space.to_s).to eq('\s')
    end
  end

  describe "#words" do
    it "returns the word and multiple matchers" do
      expect(Express.new.words.to_s).to eq('(?:\w)+')
    end
  end

  describe "#digits" do
    it "returns the digit and multiple matchers" do
      expect(Express.new.digits.to_s).to eq('(?:\d)+')
    end
  end

  describe "#spaces" do
    it "returns the whitespace and multiple matchers" do
      expect(Express.new.spaces.to_s).to eq('(?:\s)+')
    end
  end

  describe "#nonword" do
    it "returns the nonword matcher" do
      expect(Express.new.nonword.to_s).to eq('\W')
    end
  end

  describe "#nondigit" do
    it "returns the nondigit matcher" do
      expect(Express.new.nondigit.to_s).to eq('\D')
    end
  end

  describe "#nonspace" do
    it "returns the nonwhitespace matcher" do
      expect(Express.new.nonspace.to_s).to eq('\S')
    end
  end

  describe "#anything" do
    it "returns any with zero or more pattern wrapped in noncapute" do
      expect(Express.new.anything.to_s).to eq('(?:.)*')
    end
  end
end
