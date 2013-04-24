
require 'rubygems'
require 'bundler'

# requires all default gems (from the Gemfile) plus the environment's gems
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require './quotes'
run Quotes.new

