class Express
  CHARACTERS = [:word, :digit, :space]
  def initialize
    @expressions = []
  end

  def word
    add(Character.new(:word))
  end

  def digit
    add(Character.new(:digit))
  end

  def space
    add(Character.new(:space))
  end

  def any
    add(Character.new(:any))
  end

  def anything
    many(Character.new(:any), 0)
  end

  def something
    many(Character.new(:any), 1)
  end

  def tab
    add(Character.new(:tab))
  end

  def line
    either(Character.new('(?:\n)'), Character.new('(?:\r\n)'))
  end

  CHARACTERS.each do |character|
    define_method(character) do
      add(Character.new(character))
    end

    define_method("non#{character}") do
      add(Character.new(character, true))
    end

    define_method("#{character}s") do
      many(Character.new(character))
    end

    define_method("non#{character}s") do
      many(Character.new(character, true))
    end
  end

  def to_r
    Regexp.new(to_s)
  end

  def to_s
    @expressions.map(&:to_s).join
  end

  private

  def add(expression)
    tap do
      @expressions << expression
    end
  end
end

require_relative "express/character"
require_relative "express/version"
require_relative "express/wrapped"
require_relative "express/value"
require_relative "express/values"
require_relative "express/nested"
require_relative "express/modifier"
