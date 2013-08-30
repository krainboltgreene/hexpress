require "spec_helper"

describe Express::Modifier do
  class ExampleModifier
    include Express::Modifier
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
      include Express::Modifier
      def value
        "foo"
      end

      def operator
        "%"
      end
    end

    it "returns the wrapped value with operator if value exists" do
      expect(ExampleModifierWithValue.new.to_s).to eq("(?:foo)%")
    end

    class ExampleModifierWithoutValue
      include Express::Modifier
      def operator
        "%"
      end
    end

    it "returns just the operator" do
      expect(ExampleModifierWithoutValue.new.to_s).to eq("%")
    end
  end
end
