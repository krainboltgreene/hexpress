class Express
  def either(*values)
    add_value(Values::Either, values)
  end
  alias_method :and, :either
  alias_method :any_of, :either

  module Values
    class Either
      include Values

      def initialize(*values)
        @values = values
        @delimiter = "|"
      end

      def to_s
        "(?:#{values.join(delimiter)})"
      end
    end
  end
end
