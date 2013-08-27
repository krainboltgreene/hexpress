class Express
  private

  def add_nested(expression, &block)
    tap do
      @expressions << expression.new(&block)
    end
  end

  module Nested
    include Wrapped

    def delimiter
      @delimiter || ""
    end

    def expression
      if joinable? then join_expression else @expression end
    end

    def to_s
      wrapping(expression)
    end

    private

    def join_expression
      @expression.join(delimiter)
    end

    def joinable?
      @expression.respond_to?(:join)
    end
  end
end

require_relative "nested/find"
require_relative "nested/matching"
