require "spec_helper"
require "hexpress/web"

describe Hexpress::Web do
  let(:hex) { Hexpress.new }

  def pattern(name)
    hex.send(name).to_r
  end

  describe "#http" do
    it "should match ^http(?:s)?://" do
      expect(pattern(:http)).to eq(/^http(?:s)?:\/\//)
    end
  end

  describe "#https_only" do
    it "matches /^https:\/\//" do
      expect(pattern(:https_only)).to eq(/^https:\/\//)
    end
  end

  describe "#http_only" do do
    it "matches /^http:\/\//" do
      expect(pattern(:http_only)).to eq(/^http:\/\//)
    end
  end

  end

  describe "#protocol" do

  end

  describe "#subdomain" do

  end

  describe "#subdomain?" do

  end

  describe "#subdomains" do

  end

  describe "#domain" do

  end

  describe "#tld" do

  end

  describe "#tlds" do

  end

  describe "#resource" do

  end

  describe "#resources" do

  end

  describe "#ftp" do

  end

  describe "#ftps_only" do

  end

  describe "#ftp_only" do

  end
end
