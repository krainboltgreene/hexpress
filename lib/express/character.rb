class Express
  class Character
    attr_reader :upcase
    def initialize(name, upcase = false)
      @value = case name
        when :word then '\w'
        when :digit then '\d'
        when :space then '\s'
        when :any then '.'
        when :tab then '\t'
        when :newline then '\n'
        when :return then '\r'
        else name
      end
      @upcase = upcase
    end

    def value
      if upcase then @value.upcase else @value end
    end

    def to_s
      value
    end
  end
end
