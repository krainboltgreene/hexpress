class Express
  def one(value = nil, &block)
    add_value(Modifier::One, value, &block)
  end
  alias_method :maybe, :one
  alias_method :possibly, :one

  module Modifier
    class One
      include Value
      include Modifier

      def initialize(value)
        @value = value
        @operator = "?"
      end
    end
  end
end
