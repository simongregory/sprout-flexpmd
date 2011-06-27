lib = File.expand_path('lib', File.dirname(__FILE__))
$:.unshift lib unless $:.include?(lib)

require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'flexpmd'

#############################################################################
#
# Standard tasks
#
#############################################################################

Rake::TestTask.new(:test) do |t|
  t.libs << "test/unit"
  t.test_files = FileList["test/unit/*_test.rb"]
  t.verbose = true
end

CLEAN.add '*.gem'

#############################################################################
#
# Packaging tasks
#
#############################################################################

task :release do
  puts ""
  print "Are you sure you want to relase FlexPMD #{FlexPMD::VERSION}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0
  
  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end
  
  # Build gem and upload
  sh "gem build flexpmd.gemspec"
  sh "gem push flexpmd-#{FlexPMD::VERSION}.gem"
  sh "rm flexpmd-#{FlexPMD::VERSION}.gem"
  
  # Commit
  sh "git commit --allow-empty -a -m 'v#{FlexPMD::VERSION}'"
  sh "git tag v#{FlexPMD::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{FlexPMD::VERSION}"
end

task :install do
  sh "gem build flexpmd.gemspec"
  sh "gem install flexpmd-#{FlexPMD::VERSION}.gem"
end