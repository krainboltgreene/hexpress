require "spec_helper"

describe Hexpress::VERSION do
  it "should be a string" do
    expect(Hexpress::VERSION).to be_kind_of(String)
  end
end
