require "spec_helper"

describe Express::Nested do
  describe "#expression" do
    class ExampleNestedWithDelimiter
      include Express::Nested
      def initialize
        @expression = ["foo", "bar"]
        @delimiter = "."
      end
    end

    it "returns the expression items with the specified delimiter" do
      expect(ExampleNestedWithDelimiter.new.expression).to eq("foo.bar")
    end

    class ExampleNestedWithoutDelimiter
      include Express::Nested
      def initialize
        @expression = ["foo", "bar"]
      end
    end

    it "returns the expression items with the specified delimiter" do
      expect(ExampleNestedWithoutDelimiter.new.expression).to eq("foobar")
    end
  end

  describe "#to_s" do
    class ExampleNested
      include Express::Nested
      def initialize
        @expression = "foo"
        @open, @close = "{", "}"
      end
    end

    it "returns the expression wrapped in the open and close" do
      expect(ExampleNested.new.to_s).to eq("{foo}")
    end
  end
end
