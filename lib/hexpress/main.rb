require "hexpress"

def hex(&block)
  Hexpress.new(&block)
end
alias_method :hexp, :hex
