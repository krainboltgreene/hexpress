class Hexpress
  def matching(&block)
    add_nested(Nested::Matching, &block)
  end
  alias_method :like, :matching

  module Nested
    class Matching
      include Nested

      def initialize(&block)
        @hexpression = Hexpress.new.instance_eval(&block)
        @open, @close = "[", "]"
      end

      def join_hexpression
        @hexpression.map(&method(:escape)).join(delimiter)
      end

      private

      def escape(hexpression)
        if hexpression.respond_to?(:gsub)
          Regexp.escape(hexpression)
        else
          hexpression
        end
      end
    end
  end
end
