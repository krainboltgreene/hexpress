class Express
  def letter
    lower and upper
  end

  def lower(value = "a".."z")
    add(Values::Range, value)
  end

  def upper(value = "A".."Z")
    add(Values::Range, value)
  end

  def number(value = 0..9)
    add(Values::Range, value)
  end

  module Values
    class Range
      include Values

      def initialize(range)
        @values = [range.first, range.last]
        @delimiter = "-"
      end
    end
  end
end
