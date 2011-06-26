module Sprout::System

  ##
  # Monkey patch the base system so we control the output to stderr.
  #
  class BaseSystem

    ##
    # Creates a new process, executes the command
    # and returns whatever the process wrote to stdout, or stderr.
    #
    def execute(tool, options='')
      Sprout.stdout.puts("#{tool} #{options}")
      runner = get_and_execute_process_runner(tool, options)
      error  = runner.read_err
      result = runner.read

      if(result.size > 0)
        Sprout.stdout.puts result
      end

      if(error.size > 0)
        # We expect the process to write to stderror so simply print it, we don't want Sprouts 
        # to stop executing.
        Sprout.stdout.puts error
      end

      result || error
    end
    
  end
  
  ##
  # Monkey patch the unix system so we can run tool with 'java -jar'.
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