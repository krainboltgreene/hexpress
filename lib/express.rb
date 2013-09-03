class Express
  CHARACTERS = [:word, :digit, :space]
  def initialize(&block)
    @expressions = []
    instance_exec(&block) if block_given?
  end

  # Matches \w
  def word
    add(Character.new(:word))
  end

  # Matches \d
  def digit
    add(Character.new(:digit))
  end

  # Matches \s
  def space
    add(Character.new(:space))
  end

  # Matches .
  def any
    add(Character.new(:any))
  end

  # Matches (?:.)*
  def anything
    many(Character.new(:any), 0)
  end

  # Matches (?:.)+
  def something
    many(Character.new(:any), 1)
  end

  # Matches \t
  def tab
    add(Character.new(:tab))
  end

  # Matches (?:(?:\n)|(?:\r\n))
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

  # This method returns the regular expression form of this object.
  def to_r
    Regexp.new(to_s)
  end

  # This method returns the string version of the regexp.
  def to_s
    @expressions.map(&:to_s).join
  end

  private

  # This method takes an expression and adds it to the expression queue
  # while returning the main object.
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

if defined?(Rails)
  require_relative "express/main"
end
