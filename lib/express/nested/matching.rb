class Express
  # def matching(&block)
  #   add(Any, &block)
  # end

  module Nested
    class Matching
      include Nested

      def initialize(&block)
        @expression = Express.new.instance_eval(&block)
        @open = "["
        @close = "]"
      end
    end
  end
end
