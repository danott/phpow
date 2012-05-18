module Phpow

  class RackApp

    require 'net/http'
    include Phpow

    def initialize
      load_config
    end

    def call(env)      
      request = Rack::Request.new(env)
      headers = {}
      
      # Make the POW request to the Apache server
      # http://myapp.dev/full/path/goes/here/
      # ...will map to...
      # http://myapp.dev:8888/full/path/goes/here/
      http = Net::HTTP.new(request.host, apache_port)      
      response = http.send_request(request.request_method, request.fullpath, request.body.read, headers)

      # Map Net::HTTP response back to Rack::Request.call expects
      status, headers, body = response.code, response.to_hash, [response.body]

      # Research showed that browsers were choking on this for some reason.
      # Probably not the be-all-end-all solution, but works for local development thus far.
      headers.delete('transfer-encoding')

      # Send the response back to POW
      [status, headers, body]

    rescue Errno::ECONNREFUSED
      [500, {}, ["Server is down, try $ sudo apachectl start"]]
    end

  end

end