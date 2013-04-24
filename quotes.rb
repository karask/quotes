# encoding: utf-8
require 'rubygems'
require 'bundler'

class Quotes < Sinatra::Application

  configure do
    set :server, :thin
  end

  configure :development, :test do
  end

  configure :production do
  end

  # do delete or add JSON helpers...
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'

