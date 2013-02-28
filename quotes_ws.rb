# encoding: utf-8
require 'rubygems'
require 'bundler'

# requires all default gems (from the Gemfile) plus the environment's gems
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

class Quotes< Sinatra::Application

  configure do
    set :server, :trinidad
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'

