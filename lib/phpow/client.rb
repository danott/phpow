module Phpow

  class Client
    
    require 'fileutils'
    extend Phpow
    
    ##
    # A convenvetion borrowed from powify. Define the allowable command line methods.
    #
    AVAILABLE_METHODS = %w[create destroy install uninstall help]

    class << self

      ##
      # Phpow::Client.run
      #
      # A wrapper for the command line interface.
      #
      def run(args = [])

        load_config

        method = args[0].to_s.downcase
        begin
          raise "The command `#{args[0]}` does not exist for `phpow`!" unless Phpow::Client::AVAILABLE_METHODS.include?(method)
          return send(method)
        rescue Exception => e
          puts e
        end
        help
      end


      ##
      # phpow create
      # Create the symbolic links to effectively run Phpow:RackApp.
      #
      def create
        symlink_files.each do |file|
          FileUtils.ln_s(File.join(File.dirname(__FILE__), "templates", file), File.join(current_path, file))
        end
      end


      ##
      # phpow destroy
      # Unlink the files that were linked using phpow create.
      #
      def destroy
        symlink_files.each do |file|
          symlink_path = File.join(current_path, file)
          FileUtils.rm(symlink_path) if File.symlink?(symlink_path)
        end
      end


      ##
      # phpow install
      # Install the apache configuration file in `apache_conf_path`
      #
      def install
        require 'erb'
        template = ERB.new(File.read(File.join(File.dirname(__FILE__), "templates", "apache.conf.erb")))
        result = template.result(binding)

        # Need the current user to own the file in able to write to it.
        unless File.owned?(apache_conf_path)
          puts "'#{File.dirname(apache_conf_path)}' is write protected by root. You will have to enter your administrator password in order to create #{apache_conf_path}"
          %x{sudo touch #{apache_conf_path} && sudo chown #{user} #{apache_conf_path}}
        end

        f = File.new(apache_conf_path, 'w')
        f.puts(result)
        f.chmod(0644)
        f.close
      end


      ##
      # phpow uninstall
      # Remove the apache configuration file from `apache_conf_path`
      #
      def uninstall
        puts "Are you sure you want to remove the file '#{apache_conf_path}'?"
        print "Enter 'yes' to confirm: "
        
        confirmation = gets.strip.downcase
        return unless confirmation == "yes"
        
        %x{sudo rm #{apache_conf_path}}
      end


      ##
      # Print helpful information to the command line.
      #
      def help
        print <<-HELPTEXT
See README at http://github.com/danott/phpow
        HELPTEXT
      end

    end

  end

end
