require_relative "nested/find"
require_relative "nested/matching"
class Express
  module Nested
    attr_reader :open, :close

    def delimiter
      @delimiter || ""
    end

    def expression
      @expression.respond_to?(:join) ? @expression.join(delimiter) : @expression
    end

    def to_s
      "#{open}#{expression}#{close}"
    end
  end
end
