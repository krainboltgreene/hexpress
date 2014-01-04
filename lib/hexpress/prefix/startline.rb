class Hexpress
  def startline(value = nil)
    add_value(Startline, value)
  end

  class Startline
    include Value
    include Prefix

    def to_s
      "^#{value}"
    end
  end
end
