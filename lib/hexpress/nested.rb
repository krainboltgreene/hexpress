class Hexpress
  private

  def add_nested(hexpression, &block)
    tap do
      @hexpressions << hexpression.new(&block)
    end
  end

  module Nested
    include Wrapped

    def delimiter
      @delimiter || ""
    end

    def hexpression
      if joinable? then join_hexpression else @hexpression end
    end

    def to_s
      wrapping(hexpression)
    end

    private

    def join_hexpression
      @hexpression.join(delimiter)
    end

    def joinable?
      @hexpression.respond_to?(:join)
    end
  end
end

require_relative "nested/find"
require_relative "nested/matching"
