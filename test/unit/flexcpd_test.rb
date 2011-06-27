require 'test_helper'

class FlexCPDTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A FlexCPD tool" do

    setup do
      @fixture = File.join fixtures, 'cpd', 'tmp'
      FileUtils.makedirs @fixture
    end

    teardown do
      remove_file @fixture
    end

    should "accept input" do
      fcpd = FlexPMD::FCPD.new
      fcpd.source_directory = @fixture
      fcpd.output_file = 'report/cpd.xml'
      fcpd.minimum_tokens = 100

      assert_equal "-s=#{@fixture} -o=report/cpd.xml -m=100", fcpd.to_shell
    end

    should "accept input using aliases" do
      fcpd = FlexPMD::FCPD.new
      fcpd.s = @fixture
      fcpd.o = 'report/cpd.xml'
      fcpd.m = 100

      assert_equal "-s=#{@fixture} -o=report/cpd.xml -m=100", fcpd.to_shell
    end

  end
  
end
