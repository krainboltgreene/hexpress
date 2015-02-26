require "spec_helper"
require "hexpress/verbal_expressions"

describe Hexpress::Modifier do
  class ExampleModifier
    include Hexpress::Modifier
  end

  describe "#open" do
    it "returns the open operator" do
      expect(ExampleModifier.new.open).to eq("(?:")
    end
  end

  describe "#close" do
    it "returns the close operator" do
      expect(ExampleModifier.new.close).to eq(")")
    end
  end

  describe "#to_s" do
    class ExampleModifierWithValue
      include Hexpress::Modifier
      attr_reader :value

      def initialize
        @value = "foo"
      end

      def operator
        "%"
      end
    end

    it "returns the wrapped value with operator if value exists" do
      expect(ExampleModifierWithValue.new.to_s).to eq("(?:foo)%")
    end

    class ExampleModifierWithoutValue
      include Hexpress::Modifier
      def operator
        "%"
      end
    end

    it "returns just the operator" do
      expect(ExampleModifierWithoutValue.new.to_s).to eq("%")
    end
  end
end
