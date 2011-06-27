module FlexPMD 

  ##
  # Flex Copy and Paste Detector
  #
  #  (-s|--sourceDirectory) <sourceDirectory> 
  #  (-o|--outputFile) <outputFile> 
  # [(-m|--minimumTokens) <minimumTokens>]]
  #
  class FCPD < FlexPMD::Executable::Base

    ##
    # The source directory to recursively audit
    #
    add_param :source_directory, Path, { :required => true, :shell_name => '-s' }
    
    add_param_alias :s, :source_directory
    
    add_param_alias :src, :source_directory
    
    ##
    # The file to output results to.
    #
    add_param :output_file, File, { :shell_name => '-o', :file_task_name => true }
    
    add_param_alias :o, :output_file
    
    add_param_alias :output, :output_file
    
    ##
    # The minmum length of matched portions of code. A token roughly translates to a word,
    # method name, operator etc. As this is subjective experiment to find a useful value. 50 to
    # 100 is a reasonable starting point, the lower the better.
    #
    add_param :minimum_tokens, Number, { :shell_name => '-m' }
    
    add_param_alias :m, :minimum_tokens
            
    ##
    # The default executable target.
    #
    set :executable, :flexcpd
    
  end
  
end

def flexcpd *args, &block
  exe = FlexPMD::FCPD.new
  exe.to_rake(*args, &block)
  exe
end
