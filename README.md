Express
-------

  - [![Gem Version](https://badge.fury.io/rb/express.png)](https://rubygems.org/gems/express)
  - [![Code Climate](https://codeclimate.com/github/krainboltgreene/express.png)](https://codeclimate.com/github/krainboltgreene/express)
  - [![Build Status](https://travis-ci.org/krainboltgreene/express.png)](https://travis-ci.org/krainboltgreene/express)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/express.png)](https://gemnasium.com/krainboltgreene/express)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/express/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/express)


**NOTE**: This is not the [bvision/express](https://github.com/bvision/express) for slim rails packages!

The express gem is another take at the concept of ["Verbal Expressions"]() in Ruby.


Using
=====

``` ruby
require "express"

pattern = Express.new.
  starting.
  with("http").
  maybe("s").
  then("://").
  maybe { words.with(".") }.
  find { matching { [word, "-"] }.multiple }.
  then(".").
  either("com", "org").
  maybe("/").
  ending
```

After requiring express you'll have access to the Express class, which allows you to chain methods to build up a regex pattern.

You can see this pattern by calling either `Express#to_s` or `Express#to_r`:

``` ruby
pattern.to_s #=> "^http(?:s)?://(?:\\w+\\.)?([\\w\\-]+)\\.(?:com|org)(?:/)?$"
pattern.to_r #=> /^http(?:s)?:\/\/(?:\w+\.)?([\w\-]+)\.(?:com|org)(?:\/)?$/
```


Installing
==========

Add this line to your application's Gemfile:

    gem "express", "~> 1.0"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install express


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
