# The FlexPMD Sprout Gem

This [RubyGem](http://docs.rubygems.org/read/book/7) contains a rake task to add support for [FlexPMD](http://opensource.adobe.com/wiki/display/flexpmd/FlexPMD) in [Project Sprouts](http://projectsprouts.org).

Functionality is only tested on OSX, it is *not expected* to work on Windows. You may be ok on Linux.

## Install

    git clone [this repo]
    cd sprout-flexpmd
    bundle install
    gem build flexpmd.gemspec 
    gem install flexpmd
    
#### Or

    gem install flexpmd --pre

## Usage

Add the following to your rake file

    desc "Use FlexPMD to audit source code"
    flexpmd 'report/pmd' do |t|
      t.src = 'src'
    end

    desc "Use FlexCPD to detect copy pasted code"
    flexcpd 'report/cpd.xml' do |t|
      t.src = 'src'
    end

    desc "Use FlexMetrics to generate code metrics for this project"
    flexmetrics 'report/metrics' do |t|
      t.src = 'src'
    end

    task :audit => ['report/pmd', 'report/cpd.xml', 'report/metrics']
    
Then invoke it with

    rake audit
    
## MIT License

Copyright 2011 Simon Gregory

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
