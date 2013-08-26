require_relative "values/either"
require_relative "values/range"

class Express
  module Values
    attr_reader :delimiter

    def values
      @values.map { |v| v.respond_to?(:gsub) ? Regexp.escape(v) : v }
    end

    def to_s
      "#{values.join(delimiter)}"
    end
  end
end
