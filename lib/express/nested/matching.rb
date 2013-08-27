class Express
  def matching(&block)
    add_nested(Nested::Matching, &block)
  end

  module Nested
    class Matching
      include Nested

      def initialize(&block)
        @expression = Express.new.instance_eval(&block)
        @open, @close = "[", "]"
      end

      def join_expression
        @expression.map(&method(:escape)).join(delimiter)
      end

      private

      def escape(expression)
        if expression.respond_to?(:gsub)
          Regexp.escape(expression)
        else
          expression
        end
      end
    end
  end
end
