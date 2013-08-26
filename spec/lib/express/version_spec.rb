require "spec_helper"

describe Express::VERSION do
  it "should be a string" do
    expect(Express::VERSION).to be_kind_of(String)
  end
end
