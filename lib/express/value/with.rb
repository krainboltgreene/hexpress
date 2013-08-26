class Express
  # def with(value)
  #   add(With, value)
  # end
  # alias_method :has, :with
  # alias_method :then, :with
  # alias_method :including, :with

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
