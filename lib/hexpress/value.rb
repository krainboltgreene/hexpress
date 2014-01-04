class Hexpress
  module Value
    def initialize(value = nil)
      @value = value
    end

    def value
      Regexp.escape(@value || "")
    end

    def to_s
      "#{value}"
    end
  end
end
