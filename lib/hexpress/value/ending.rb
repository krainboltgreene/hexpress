class Hexpress
  def ending(value = nil)
    add_value(Value::Ending, value)
  end
  alias_method :begins, :ending
  alias_method :begin, :ending
  alias_method :start, :ending

  module Value
    class Ending
      include Value

      def initialize(value = nil)
        @value = value
      end

      def to_s
        "#{value}$"
      end
    end
  end
end
