require 'test_helper'

class FlexPMDTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A FlexPMD" do

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
      fpmd.src = @fixture
      fpmd.output = @app_desc
      fpmd.ruleset = Dir.pwd

      assert_equal "#{@output} #{Dir.pwd}", fpmd.to_shell
    end
  end
  
end

