# -*- encoding: utf-8 -*-
lib = File.expand_path File.join(File.dirname(__FILE__), 'lib')
$:.unshift lib unless $:.include?(lib)

require 'bundler'
require 'flexpmd'

Gem::Specification.new do |s|
  s.name                      = FlexPMD::NAME
  s.version                   = FlexPMD::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = ["Simon Gregory"]
  s.email                     = "projectsprouts@googlegroups.com"
  s.homepage                  = "http://projectsprouts.org"
  s.summary                   = "Code auditing for ActionScript and Flex"
  s.description               = "Project Sprouts support for FlexPMD"
  s.required_rubygems_version = ">= 1.3.6"
  s.files                     = FileList['**/**/*'].exclude /.DS_Store|.svn|.git|.tmproj|tmp|.gem/
  s.add_bundler_dependencies
  s.require_paths << 'lib'
end

