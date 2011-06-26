module Sprout::System

  ##
  # Monkey patch the base system so we can inject 'java -jar' etc..
  #
  class UnixSystem < BaseSystem

    ##
    # Get a process runner and execute the provided +executable+,
    # with the provided +options+.
    #
    # +executable+ String path to the external executable file.
    #
    # +options+ String commandline options to send to the +executable+.
    #
    def get_and_execute_process_runner tool, options=nil
      runner = get_process_runner
      raise Sprout::Errors::ExecutionError.new("[ERROR] Java is required for this tool to run.") unless `which java` =~ /java$/
      runner.execute_open4 "java -Xms64m -Xmx768m -jar "+ clean_path(tool), options
      runner
    end
    
  end
end