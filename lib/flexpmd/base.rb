module Sprout::System
  
  ##
  # Extend the unix system so we can run tools with a 'java -jar' prefix.
  #
  class JavaUnixSystem < UnixSystem
    
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
        # We expect the process to write to stderror so filter and print it, we don't want Rake 
        # to stop executing. 'WARNING' is consciously supressed as I've not seen it used as a 
        # prefix to anything meaningful.
        #
        error.each_line { |line| Sprout.stdout.puts line if line =~ /^(ERROR|INFO):/ }
      end

      result || error
    end

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

module FlexPMD
  module Executable
    class Base < Sprout::Executable::Base
      ##
      # This isn't very friendly to non unix users and needs to be addressed in future releases.
      def system_execute binary, params
        sys = Sprout::System::JavaUnixSystem.new
        sys.execute binary, params
      end
    end
  end  
end
