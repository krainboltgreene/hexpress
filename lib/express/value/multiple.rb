class Express
  # def multiple(value = nil)
  #   add(Multiple, value)
  # end

  module Value
    class Multiple
      include Value

      def initialize(value = nil)
        @value = value
      end

      def to_s
        "#{value}+"
      end
    end
  end
end
