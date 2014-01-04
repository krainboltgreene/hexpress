class Hexpress
  def one(value = nil, &block)
    add_value(Suffix::One, value, &block)
  end
  alias_method :maybe, :one
  alias_method :possibly, :one

  module Suffix
    class One
      include Value
      include Suffix

      def initialize(value)
        @value = value
        @operator = "?"
      end
    end
  end
end
