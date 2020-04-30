# frozen_string_literal: true

# This is a very cut-down API class for Prometheus only to allow
# the stats to be gathered if the API service is not enabled.
# Defaults to same configuration/ports as for the API
require 'rack'
require 'sinatra'

require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'


# Prometheus Endpoints
use Rack::Deflater
use Prometheus::Middleware::Exporter
use Prometheus::Middleware::Collector

get '/bar' do
    'Hello BAR World!!!'
end

