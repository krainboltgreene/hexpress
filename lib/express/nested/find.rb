class Express
  # def find(&block)
  #   add(Find, Express.new.instance_eval(&block))
  # end
  # alias_method :capture, :find

  module Nested
    class Find
      include Nested

      def initialize(value = nil, &block)
        @expression = value || Express.new.instance_eval(&block)
        @open, @close = "(", ")"
      end
    end
  end
end
