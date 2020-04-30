
require 'sinatra'
require './prom-api'

torun_threads = []

prom_api = Thread.new do
    thr = Vmpooler::PrometheusAPI.new
    # thr.helpers.configure(config)
    thr.helpers.execute!
end

torun_threads << prom_api


torun_threads.each(&:join)
