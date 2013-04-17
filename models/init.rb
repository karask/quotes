# encoding: utf-8
require 'sequel'

#Sequel::Model.plugin(:schema)

if ENV['RACK_ENV'] == "production"
#  DB = Sequel.connect('postgres://user:password@localhost/blog')
#  DB << "SET CLIENT_ENCODING TO 'UTF8';"  # also see :encoding param from postgres
  DB = Sequel.sqlite('db/quotes.db')
else
  DB = Sequel.sqlite('db/quotes.db')
end

require_relative 'authors'
require_relative 'tags'
require_relative 'quotes'
