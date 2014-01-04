class Hexpress
  module Suffix
    attr_reader :operator

    def to_s
      if @value
        "#{super}#{operator}"
      else
        operator
      end
    end
  end
end
