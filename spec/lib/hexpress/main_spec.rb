require "spec_helper"
require "hexpress/main"

describe Hexpress do
  describe "hexp" do
    it "allow for a chain of methods" do
      expect(hexp.find("foo").to_r).to eq(/(foo)/)
    end

    it "allow for a block of methods" do
      expect(hexp { find("foo") }.to_r).to eq(/(foo)/)
    end
  end
end
