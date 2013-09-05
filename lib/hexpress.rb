class Hexpress
  CHARACTERS = [:word, :digit, :space]
  def initialize(&block)
    @hexpressions = []
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

  # This method returns the regular hexpression form of this object.
  def to_r
    Regexp.new(to_s)
  end

  # This method returns the string version of the regexp.
  def to_s
    @expressions.map(&:to_s).join
  end

  private

  # This method takes an hexpression and adds it to the hexpression queue
  # while returning the main object.
  def add(expression)
    tap do
      @expressions << expression
    end
  end
end

require_relative "hexpress/character"
require_relative "hexpress/version"
require_relative "hexpress/wrapped"
require_relative "hexpress/value"
require_relative "hexpress/values"
require_relative "hexpress/nested"
require_relative "hexpress/modifier"

if defined?(Rails)
  require_relative "hexpress/main"
end
