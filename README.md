Hexpress
-------

  - [![Gem Version](https://badge.fury.io/rb/hexpress.png)](https://rubygems.org/gems/hexpress)
  - [![Code Climate](https://codeclimate.com/github/krainboltgreene/hexpress.png)](https://codeclimate.com/github/krainboltgreene/hexpress)
  - [![Build Status](https://travis-ci.org/krainboltgreene/hexpress.png?branch=master)](https://travis-ci.org/krainboltgreene/hexpress)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/hexpress.png)](https://gemnasium.com/krainboltgreene/hexpress)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/hexpress/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/hexpress)

The hexpress gem is another take at the concept of ["Verbal Hexpressions"]() in Ruby.


Using
=====

``` ruby
require "hexpress"

pattern = Hexpress.new

pattern = Hexpress.new.
  start("http").
  maybe("s").
  with("://").
  maybe { words.with(".") }.
  find { matching { [word, "-"] }.multiple }.
  has(".").
  either("com", "org").
  maybe("/").
  ending
```

After requiring hexpress you'll have access to the Hexpress class, which allows you to chain methods to build up a regex pattern.

You can see this pattern by calling either `Hexpress#to_s` or `Hexpress#to_r`:

``` ruby
pattern.to_s #=> "^http(?:s)?://(?:(?:\\w)+\\.)?([\\w\\-]+)\\.(?:com|org)(?:/)?$"
pattern.to_r #=> /^http(?:s)?:\/\/(?:(?:\w)+\.)?([\w\-]+)\.(?:com|org)(?:\/)?$/
```

You can also get access to a global method by doing the following (automatically done in any rails application):

``` ruby
require_relative "hexpress/main"

hexp.start("http").maybe("s")

hexp do
  start("http")
  maybe("s")
end
```

In addition we've bundled an extra set of helpers for specific use cases like the web:

``` ruby
require "hexpress"
require "hexpress/web"

pattern = hexp.http.domain("amazon").tld("com")
pattern = hexp.ftp # ...
```

You can even do advanced composure of multiple patterns:

``` ruby
protocol = exp.start("http").maybe("s").with("://")
tld = exp.then(".").either("org", "com", "net")
link = exp.has(protocol).find { words }.including(tld)
```

It's also entirely feasible to compound two or more patterns together:

``` ruby
protocol = exp.start("http").maybe("s").with("://")
domain = exp.find { words }
tld = exp.then(".").either("org", "com", "net")
link =  protocol + domain + tld
```

Hexpressions are very flexible.

Installing
==========

Add this line to your application's Gemfile:

    gem "hexpress", "~> 1.0"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hexpress


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request


Licensing
=========

Copyright (c) 2013 Kurtis Rainbolt-Greene

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
