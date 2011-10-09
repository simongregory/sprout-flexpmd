module FlexPMD

  ##
  # FlexMetrics API
  #
  # (-s|--sourceDirectory) <sourceDirectory>
  # (-o|--outputDirectory) <outputDirectory>
  #
  class FlexMetrics < FlexPMD::Executable::Base

    ##
    # The source path to run flexpmd against.
    add_param :source_directory, Path, { :required => true, :shell_name => '-s', :default => 'src' }

    add_param_alias :s, :source_directory

    add_param_alias :src, :source_directory

    add_param :output_directory, File, { :shell_name => '-o', :file_task_name => true, :default => 'report/metrics.xml' }

    add_param_alias :o, :output_directory

    add_param_alias :output, :output_directory

    ##
    # The default executable target.
    #
    set :executable, :flexmetrics

  end

end

def flexmetrics *args, &block
  exe = FlexPMD::FlexMetrics.new
  exe.to_rake(*args, &block)
  exe
end
