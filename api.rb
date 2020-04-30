# frozen_string_literal: true

module Vmpooler
  class API < Sinatra::Base
    def initialize
      super
    end

    get '/api' do
      'Hello from /api'
    end

    # Load Prometheus metrics
    # This could be tied to a config setting being set to enable them
    require './prom-api'
    use Vmpooler::PrometheusAPI

    def execute!
      puts "DBG: Execute! line was reached by api.rb"
      self.settings.run!
    end
  end
end
