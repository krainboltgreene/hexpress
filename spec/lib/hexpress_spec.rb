require "spec_helper"

describe Hexpress do
  it "takes a list of expressions and turns them into a regex" do
    expressions = [Hexpress::Value::With.new("foo"), Hexpress::Value::With.new("bar")]
    pattern = Hexpress.new(*expressions)
    expect(pattern.to_r).to eq(/foobar/)
  end

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

  describe "#+" do
    it "returns a combination of any number of expressions" do
      pattern1 = Hexpress.new.with("foo")
      pattern2 = Hexpress.new.with("bar")
      pattern3 = Hexpress.new.with("bang")
      pattern4 = pattern1 + pattern2 + pattern3
      expect(pattern4.to_r).to eq(/foobarbang/)
    end
  end

  describe "#to_regexp" do
    it "should return a Regexp object" do
      Hexpress.new.to_regexp.should be_a(Regexp)
    end
  end

  describe "acts as a Regexp" do
    it "should work for Regexp#try_convert" do
      Regexp.try_convert(Hexpress.new).should_not be_nil
    end

    it "should be able to match" do
      Hexpress.new.with("foo").match("foo").should_not be_nil
    end

    it "should match using #=~" do
      (Hexpress.new.with("foo") =~ "foo").should eq(0)
    end

    it "should match using ===" do
      (Hexpress.new.with("foo") === "foo").should be_true
    end

    it "should be able to be matched by strings using =~" do
      ("foo" =~ Hexpress.new.with("foo")).should be_true
    end
  end
end
