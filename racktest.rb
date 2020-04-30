# frozen_string_literal: true

require 'sinatra'

torun_threads = []
if ARGV.count == 0
  torun = ['api', 'blocker']
else
  torun = []
  torun << 'api' if ARGV.include? 'api'
  torun << 'blocker' if ARGV.include? 'blocker'
  exit(2) if torun.empty?
end

if torun.include? 'api'
  require './api'
  torun_threads << Thread.new do
    thr = Vmpooler::API.new
    thr.helpers.execute!
  end
end

if torun.include? 'blocker'
  torun_threads << Thread.new do
    while true
      puts 'hello from blocker thread'
      sleep 30
    end
  end
end

torun_threads.each(&:join)
