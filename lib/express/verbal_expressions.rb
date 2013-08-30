require "express"
require "pry"

class Express
  alias_method :startOfLine, :starting
  alias_method :then, :with
  alias_method :lineBreak, :line
  alias_method :br, :line

  def anythingBut(value)
    many(matching { without(value) }.to_s, 0)
  end

  def somethingBut(value)
    something and without(value)
  end

  module Modifier
    class Many
      def to_s
        "#{open}#{value}#{operator}#{close}"
      end
    end
  end

  module Nested
    class Find
      def open
        "(?:"
      end
    end
  end
end
