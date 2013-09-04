require "spec_helper"

describe Hexpress::Nested do
  describe "#hexpression" do
    class ExampleNestedWithDelimiter
      include Hexpress::Nested
      def initialize
        @hexpression = ["foo", "bar"]
        @delimiter = "."
      end
    end

    it "returns the hexpression items with the specified delimiter" do
      expect(ExampleNestedWithDelimiter.new.hexpression).to eq("foo.bar")
    end

    class ExampleNestedWithoutDelimiter
      include Hexpress::Nested
      def initialize
        @hexpression = ["foo", "bar"]
      end
    end

    it "returns the hexpression items with the specified delimiter" do
      expect(ExampleNestedWithoutDelimiter.new.hexpression).to eq("foobar")
    end
  end

  describe "#to_s" do
    class ExampleNested
      include Hexpress::Nested
      def initialize
        @hexpression = "foo"
        @open, @close = "{", "}"
      end
    end

    it "returns the hexpression wrapped in the open and close" do
      expect(ExampleNested.new.to_s).to eq("{foo}")
    end
  end
end
