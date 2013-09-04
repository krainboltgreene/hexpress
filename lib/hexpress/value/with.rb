class Hexpress
  def with(value)
    add_value(Value::With, value)
  end
  alias_method :has, :with
  alias_method :including, :with

  module Value
    class With
      include Value

      def initialize(value)
        @value = value
      end

      def to_s
        "#{value}"
      end
    end
  end
end
