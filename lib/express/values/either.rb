class Express
  def either(*values)
    add_value(Values::Either, values)
  end
  alias_method :and, :either
  alias_method :any_of, :either

  module Values
    class Either
      include Values
      include Wrapped

      def initialize(*values)
        @values = values
        @delimiter = "|"
        @open, @close = "(?:", ")"
      end

      def to_s
        "#{open}#{values.join(delimiter)}#{close}"
      end
    end
  end
end
