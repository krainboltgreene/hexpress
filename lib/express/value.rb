require_relative "value/ending"
require_relative "value/except"
require_relative "value/maybe"
require_relative "value/multiple"
require_relative "value/starting"
require_relative "value/with"

class Express
  module Value
    def value
      Regexp.escape(@value || "")
    end
  end
end
