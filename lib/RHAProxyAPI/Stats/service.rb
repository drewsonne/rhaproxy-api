require 'RHAProxyAPI/Stats/info'
require 'RHAProxyAPI/Stats/health'
require 'RHAProxyAPI/Stats/queue'
require 'RHAProxyAPI/Stats/session'
require 'RHAProxyAPI/Stats/bytes'
require 'RHAProxyAPI/Stats/rate'
require 'RHAProxyAPI/Stats/abort'
require 'RHAProxyAPI/Stats/denied'
require 'RHAProxyAPI/Stats/error'
require 'RHAProxyAPI/Stats/warning'
require 'RHAProxyAPI/Stats/http_response_code'

module RHAProxyAPI
  module Stats
    class Service
      attr_accessor :info
      attr_accessor :info
      attr_accessor :health
      attr_accessor :queue
      attr_accessor :session
      attr_accessor :bytes
      attr_accessor :rate
      attr_accessor :abort
      attr_accessor :denied
      attr_accessor :error
      attr_accessor :warning
      attr_accessor :http_response_code

      def self.create_from_line(line)
        instance = self.new
        instance.set_from_line(line)
      end

      def set_from_line(line)
        @info = Info.new(line)
        @health = Health.new(line)
        @queue = RAHQueue.new(line)
        @session = Session.new(line)
        @bytes = Bytes.new(line)
        @rate = Rate.new(line)
        @abort = Abort.new(line)
        @denied = Denied.new(line)
        @error = Error.new(line)
        @warning = Warning.new(line)
        @http_response_code = HttpResponseCode.new(line)
        self
      end
    end
  end
end
