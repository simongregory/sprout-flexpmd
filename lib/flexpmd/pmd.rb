module FlexPMD 

  ##
  # FlexPMD API
  #
  # (-s|--sourceDirectory) <sourceDirectory> 
  # (-o|--outputDirectory) <outputDirectory> 
  #[(-r|--ruleSet) <ruleSet>]
  #[(-e|--excludePackage) <excludePackage>]
  #
  class FPMD < FlexPMD::Executable::Base

    ##
    # The source path to run flexpmd against.
    add_param :source_directory, Path, { :required => true, :shell_name => '-s' }
    
    add_param_alias :s, :source_directory
    
    add_param_alias :src, :source_directory

    add_param :output_directory, File, { :shell_name => '-o', :file_task_name => true }    
    
    add_param_alias :o, :output_directory
    
    add_param_alias :output, :output_directory
    
    add_param :rule_set, File, { :shell_name => '-r' }
    
    add_param_alias :r, :rule_set
        
    add_param :exclude_package, String, { :shell_name => '-e' }
    
    add_param_alias :e, :exclude_package
    
    ##
    # The default executable target.
    #
    set :executable, :flexpmd

  end
  
end

def flexpmd *args, &block
  exe = FlexPMD::FPMD.new
  exe.to_rake(*args, &block)
  exe
end
