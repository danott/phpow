module Phpow
  class Client
    AVAILABLE_METHODS = %w[preview install uninstall]

    def run(args = [])
      command_name = args.shift

      if AVAILABLE_METHODS.include?(command_name)
        apache_configuration = ApacheConfiguration.new()
        apache_configuration.send(command_name)
      else
        puts "The command `#{command_name}` does not exist for `phpow`!"
      end
    end
  end
end
