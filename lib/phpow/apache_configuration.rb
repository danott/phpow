require 'erb'

module Phpow
  class ApacheConfiguration
    attr_accessor :port, :document_root

    def initialize(args = {})
      @port = args.fetch(:port, 8888)
      @document_root = args.fetch(:document_root, default_document_root)
    end

    def preview
      puts template_result
    end

    def install
      puts "You are about to write the file '#{pathname}'?"
      print "Enter 'yes' to confirm: "
      return unless gets.strip == "yes"

      write_file
    end

    def uninstall
      puts "You are about to permanently delete the file '#{pathname}'?"
      print "Enter 'yes' to confirm: "
      return unless gets.strip == "yes"

      File.delete(pathname)
    end

    private

    def pathname
      "/etc/apache2/users/#{user}.conf"
    end

    def user
      %x{whoami}.strip
    end

    def default_document_root
      "/Users/#{user}/Sites"
    end

    def ensure_file_has_ideal_permissions
      File.chmod(0644, pathname)
    end

    def ensure_file_is_writable
      unless File.owned?(pathname)
        puts "'#{File.dirname(pathname)}' is write protected by root. You will have to enter your administrator password in order to create #{pathname}"
        %x{sudo touch #{pathname} && sudo chown #{user} #{pathname}}
      end
    end

    def write_file
      ensure_file_is_writable
      ensure_file_has_ideal_permissions
      File.write(pathname, template_result)
    end

    def template_result
      template_source.result(instance_eval { binding })
    end

    def template_source
      ERB.new(File.read(File.join(File.dirname(__FILE__), "templates", "apache.conf.erb")))
    end
  end
end
