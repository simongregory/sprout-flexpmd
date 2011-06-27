require 'test_helper'

class FlexPMDTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A FlexPMD tool" do

    setup do
      @fixture = File.join fixtures, 'flexpmd', 'tmp'
      FileUtils.makedirs @fixture
      @ruleset = File.join @fixture, 'ruleset.xml'
    end

    teardown do
      remove_file @fixture
    end

    should "accept input" do
      fpmd = FlexPMD::FPMD.new
      fpmd.source_directory = @fixture
      fpmd.output_directory = 'report/pmd'
      fpmd.rule_set = Dir.pwd
      fpmd.exclude_package = 'org.foo'

      assert_equal "-s=#{@fixture} -o=report/pmd -r=#{Dir.pwd} -e=org.foo", fpmd.to_shell
    end
    
    should "accept input using aliases" do
      fpmd = FlexPMD::FPMD.new
      fpmd.s = @fixture
      fpmd.o = 'report/pmd'
      fpmd.r = Dir.pwd
      fpmd.e = 'org.foo'
      
      assert_equal "-s=#{@fixture} -o=report/pmd -r=#{Dir.pwd} -e=org.foo", fpmd.to_shell
    end
    
  end
  
end
