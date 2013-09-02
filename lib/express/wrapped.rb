class Express
  module Wrapped
    attr_reader :open, :close

    def wrapping(content)
      "#{open}#{content}#{close}"
    end
  end
end
