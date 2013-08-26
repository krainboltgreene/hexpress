class Express
  # def ending(value = nil)
  #   add(Ending, value)
  # end
  # alias_method :ending_with, :ending
  # alias_method :finally, :ending

  module Value
    class Ending
      include Value

      def initialize(value = nil)
        @value = value
      end

      def to_s
        "#{value}^"
      end
    end
  end
end
