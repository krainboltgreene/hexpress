require_relative "express/version"
require_relative "express/value"
require_relative "express/values"
require_relative "express/nested"

class Express
  def initialize
    @expressions = []
  end

  def word
    '\w'
  end

  def digit
    '\d'
  end

  def space
    '\s'
  end

  [:word, :digit, :space].each do |m|
    define_method("non#{m}") do
      m.upcase
    end

    define_method("#{m}s") do
      m and multiple
    end
  end

  def to_r
    Regexp.new(to_s)
  end

  def to_s
    @expressions.map(&:to_s).join
  end

  private

  def add(expression, value = nil)
    tap do
      @expressions << (value ? expression.new(value) : expression.new)
    end
  end
end
