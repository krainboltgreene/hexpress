class Hexpress
  module Web
    def email
      nonspaces.with('@').nonspaces.with('.').nonspaces
    end

    def http
      start("http").maybe("s").protocol
    end

    def http_only
      start("http").protocol
    end

    def https_only
      start("https").protocol
    end

    def protocol
      with("://")
    end

    def domain(name)
      maybe { words.with(".") }.find(name)
    end

    def tld(name)
      has(".").with(name).maybe("/")
    end

    def ftp
      start("ftp").maybe("s").protocol
    end

    def ftp_only
      start("ftp").protocol
    end

    def ftps_only
      start("ftps").protocol
    end

    def path
      has("/").anything.maybe.maybe("?")
    end
  end

  include Web
end
