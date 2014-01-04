class Hexpress
  def many(value = nil, minimum = 1)
    add_values(Many, value, minimum)
  end

  class Many
    include Value
    include Wrapped
    include Suffix
    include Noncapture

    def initialize(value, minimum = 1)
      super(value)
      @minimum = minimum
    end

    def operator
      case @minimum
        when 0 then "*"
        when 1 then "+"
      end
    end
  end
end
