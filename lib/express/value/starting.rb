class Express
  # def starting(value = nil)
  #   add(Start, value)
  # end
  # alias_method :begins, :starting
  # alias_method :begin, :starting
  # alias_method :start, :starting

  module Value
    class Starting
      include Value

      def initialize(value = nil)
        @value = value
      end

      def to_s
        "$#{value}"
      end
    end
  end
end
