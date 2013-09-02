require "spec_helper"

describe Express::Modifier::Many do
  describe "#operator" do
    class ExampleWithMany < Express::Modifier::Many
      def initialize(minimum)
        @minimum = minimum
      end
    end

    it "returns * if minimum is 0" do
      expect(ExampleWithMany.new(0).operator).to eq("*")
    end

    it "returns + if minimum is 1" do
      expect(ExampleWithMany.new(1).operator).to eq("+")
    end
  end
end
