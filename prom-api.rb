# frozen_string_literal: true

# This is a very cut-down API class for Prometheus only to allow
# the stats to be gathered if the API service is not enabled.
# Defaults to same configuration/ports as for the API
require 'rack'
require 'sinatra/base'

require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

module Vmpooler
  class PrometheusAPI < Sinatra::Base

    # Prometheus Endpoints
    use Rack::Deflater
    use Prometheus::Middleware::Exporter
    use Prometheus::Middleware::Collector

    def execute!
        puts "DBG: Execute! line was reached by #{caller.join("\n")}"
        self.settings.run!
    end
  
    get '/foo' do
        'Hello Foo World!!!'
    end
  end

end

