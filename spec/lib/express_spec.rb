require "spec_helper"

describe Express do

  describe "#word" do
    it "returns the word matcher" do
      expect(Express.new.word).to eq('\w')
    end
  end

  describe "#digit" do
    it "returns the digit matcher" do
      expect(Express.new.digit).to eq('\d')
    end
  end

  describe "#space" do
    it "returns the whitespace matcher" do
      expect(Express.new.space).to eq('\s')
    end
  end
end
