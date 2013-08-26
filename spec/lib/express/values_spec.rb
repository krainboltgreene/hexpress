require "spec_helper"

describe Express::Values do
  describe "#values" do
    class ExampleValues
      include Express::Values

      def initialize(*values)
        @delimiter = "."
        @values = values
      end
    end

    it "returns the values list" do
      expect(ExampleValues.new("foo", "bar").values).to eq(["foo", "bar"])
    end

    it "escapes the regex characters" do
      expect(ExampleValues.new("fo.o", "bar").values).to eq(["fo\\.o", "bar"])
    end
  end
end
