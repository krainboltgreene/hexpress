class Express
  def many(value = nil, minimum = 1)
    add_values(Modifier::Many, value, minimum)
  end
  alias_method :multiple, :many

  module Modifier
    class Many
      include Value
      include Modifier

      def initialize(value, minimum = 1)
        @value = value
        @minimum = minimum
      end

      def operator
        case @minimum
          when 0 then "*"
          when 1 then "+"
        end
      end
    end
  end
end
