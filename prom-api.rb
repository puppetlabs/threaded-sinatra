# frozen_string_literal: true

require 'prometheus/client'
require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

puts "DBG: Using Prometheus Collector"
use Prometheus::Middleware::Collector, metrics_prefix: 'threaded_sinatra'

puts "DBG: Using Prometheus Exporter"
use Prometheus::Middleware::Exporter, path: '/prometheus'

module Vmpooler
  class PrometheusAPI < Sinatra::Base

    # returns a default registry
    prometheus = Prometheus::Client.registry

    # create a new counter metric
    http_requests = Prometheus::Client::Counter.new(:http_requests, docstring: 'A counter of HTTP requests made')
    # register the metric
    prometheus.register(http_requests)

    get '/foo' do
      'Hello Foo World!!!'
      http_requests.increment
    end

    def execute!
      puts "DBG: Execute! line was reached by prom-api.rb"
      self.settings.run!
    end
  end
end
