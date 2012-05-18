require 'phpow/client'
require 'phpow/rack_app'

module Phpow

  attr_accessor :apache_port, :projects_directory

  def apache_port
    @apache_port || 8888
  end

  def projects_directory
    @projects_directory || "/Users/#{user}/Sites"
  end

  def projects_directory=(directory)
    @projects_directory = directory.gsub(/\/*$/, '')
  end

  def current_path
    %x{pwd}.strip
  end

  def user
    %x{whoami}.strip
  end

  def apache_conf_path
    "/etc/apache2/users/#{user}.conf"
  end

  def symlink_files
    %w[config.ru .powconfig]
  end


  ##
  # Configuration variables can be stored in '~/.phpowconfig'
  # 
  # PHPOW_APACHE_PORT: Configure apache to run on a port other than 8888
  # PHPOW_PROJECTS_DIRECTORY: Serve your projects out of a directory other than /Users/user/Sites
  #
  def load_config     
    if File.exists?(File.expand_path('~/.phpowconfig'))
      self.apache_port = %x{source ~/.phpowconfig; echo $PHPOW_APACHE_PORT}.strip unless %x{source ~/.phpowconfig; echo $PHPOW_APACHE_PORT}.strip.empty?
      self.projects_directory = %x{source ~/.phpowconfig; echo $PHPOW_PROJECTS_DIRECTORY}.strip unless %x{source ~/.phpowconfig; echo $PHPOW_PROJECTS_DIRECTORY}.strip.empty?
    end
  end

end