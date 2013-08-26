require "express"

def exp(&block)
  if block_given?
    Express.new.instance_eval(&block)
  else
    Express.new
  end
end
