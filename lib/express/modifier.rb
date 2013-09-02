class Express
  module Modifier
    OPEN = "(?:"
    CLOSE = ")"
    attr_reader :operator

    def open
      OPEN
    end

    def close
      CLOSE
    end

    def to_s
      if @value
        "#{open}#{value}#{close}#{operator}"
      else
        operator
      end
    end
  end
end

require_relative "modifier/many"
require_relative "modifier/one"
