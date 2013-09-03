require "spec_helper"
require "express/main"

describe Express do
  describe "exp" do
    it "allow for a chain of methods" do
      expect(exp.find("foo").to_r).to eq(/(foo)/)
    end

    it "allow for a block of methods" do
      expect(exp { find("foo") }.to_r).to eq(/(foo)/)
    end
  end
end
