class Hexpress
  module Wrapped
    private

    def open
      self.class.const_get("OPEN")
    end

    def close
      self.class.const_get("CLOSE")
    end

    def to_s
      "#{open}#{super}#{close}"
    end
  end
end
