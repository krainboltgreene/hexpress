require "spec_helper"

describe Hexpress::Value do
  describe "#value" do
    class ExampleValue
      include Hexpress::Value

      def initialize(value)
        @value = value
      end
    end

    it "returns the string given" do
      expect(ExampleValue.new("foo").value).to eq("foo")
    end

    it "returns regex characters escaped" do
      expect(ExampleValue.new("fo.o").value).to eq("fo\\.o")
    end

    it "returns an empty string if value not given" do
      expect(ExampleValue.new(nil).value).to eq("")
    end
  end
end
