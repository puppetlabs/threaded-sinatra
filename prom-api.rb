# frozen_string_literal: true

# This is a very cut-down API class for Prometheus only to allow
# the stats to be gathered if the API service is not enabled.
# Defaults to same configuration/ports as for the API
require 'rack'
require 'sinatra/base'

require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

# Prometheus Endpoints
use Prometheus::Middleware::Collector

module Vmpooler
  class PrometheusAPI < Sinatra::Base

    use Rack::Deflater
    use Prometheus::Middleware::Exporter

    def execute!
        Prometheus::Middleware::Collector.new(self.settings)
        self.settings.run!
    end
  
    get '/foo' do
        'Hello Foo World!!!'
    end
  end

end

