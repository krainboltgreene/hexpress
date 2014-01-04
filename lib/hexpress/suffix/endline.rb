class Hexpress
  def endline(value = nil)
    add_value(Endline, value)
  end

  class Endline
    include Value

    def initialize(value = nil)
      @value = value
    end

    def to_s
      "#{value}$"
    end
  end
end
