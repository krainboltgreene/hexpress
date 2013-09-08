require "spec_helper"
require "hexpress/web"

describe Hexpress::Web do
  describe "email" do
    it "matches standard email" do
      expect('lokson@live.com').to match(Hexpress.new.email.to_r)
    end
  end
end
