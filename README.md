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

    gem install flexpmd

## Usage

Add the following to your rake file

    flexpmd 'report/pmd' do |t|
      t.src = 'src'
    end

    flexcpd 'report/cpd.xml' do |t|
      t.src = 'src'
      t.minimum_tokens = 50
    end

    flexmetrics 'report/metrics.xml' do |t|
      t.src = 'src'
    end

    desc "Run FlexPMD, FlexCPD, and FlexMetrics to audit the project"
    task :audit => ['report/pmd', 'report/cpd.xml', 'report/metrics.xml']
    
Then invoke it with

    rake audit
    
Output can be found in the `report/` directory created in the project root. This is best consumed via the relevant [Jenkins](http://jenkins-ci.org/) plugins.

## Versioning

The version number of the gem is based on the underlying FlexPMD release number, ie 1.2, followed by a single digit expressing the gem version.

## On the horizon

Initial release has focused on enabling report generation. As the reports are in xml, and not easy on the eye, it is intended that they are post consumed and output to the command line in a more relevant format.
    
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
