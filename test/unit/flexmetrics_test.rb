require 'test_helper'

class FlexMetricsTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A FlexMetrics tool" do

    setup do
      @fixture = File.join fixtures, 'metrics', 'tmp'
      FileUtils.makedirs @fixture
    end

    teardown do
      remove_file @fixture
    end

    should "accept input" do
      fcpd = FlexPMD::FlexMetrics.new
      fcpd.source_directory = @fixture
      fcpd.output_directory = 'report/metrics.xml'

      assert_equal "-s=#{@fixture} -o=report/metrics.xml", fcpd.to_shell
    end

    should "accept input using aliases" do
      fcpd = FlexPMD::FlexMetrics.new
      fcpd.s = @fixture
      fcpd.o = 'report/metrics.xml'

      assert_equal "-s=#{@fixture} -o=report/metrics.xml", fcpd.to_shell
    end

  end
  
end
