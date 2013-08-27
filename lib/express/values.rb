class Express
  def add_values(expression, *vs)
    add(expression.new(*vs))
  end

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

require_relative "values/either"
require_relative "values/range"
