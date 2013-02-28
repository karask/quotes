# encoding: utf-8
require 'sequel'

Sequel::Model.plugin(:schema)

if ENV['RACK_ENV'] == "production"
  DB = Sequel.connect('postgres://user:password@localhost/blog')
  DB << "SET CLIENT_ENCODING TO 'UTF8';"  # also see :encoding param from postgres
else
  DB = Sequel.sqlite
end


require_relative 'authors'
require_relative 'quotes'
