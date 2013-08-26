class Express
  # def maybe(value)
  #   add(Maybe, value)
  # end
  # alias_method :possibly, :maybe

  module Value
    class Maybe
      include Value

      def initialize(value)
        @value = value
      end

      def to_s
        "(?:#{value})?"
      end
    end
  end
end
