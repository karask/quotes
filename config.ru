# requires all default gems (from the Gemfile) plus the environment's gems
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

root = ::File.dirname(__FILE__)
require ::File.join( root, 'quotes' )
run Quotes.new

