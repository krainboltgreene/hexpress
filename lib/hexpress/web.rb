class Hexpress
  module Web
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

    def subdomain(name = nil)
      name ? words : with(name)
      with(".")
    end

    def subdomain?(name = nil)
      maybe { subdomain(name) }
    end

    def subdomains(*names)
      either(*names).with(".")
    end

    def domain(name)
      find(name)
    end

    def tld(name)
      has(".").with(name)
    end

    def tlds(*names)
      has(".").either(*names)
    end

    def resource(name = nil)
      has("/")
      name ? anything : find(name)
    end

    def resources(*names)
      has("/").either(*names)
    end

    def query
      has("?").find { something }
    end

    def hash
      has("#").find { something }.ending
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
  end

  include Web
end
