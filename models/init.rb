# encoding: utf-8
require 'sequel'

#Sequel::Model.plugin(:schema)

if ENV['RACK_ENV'] == "production"
  # DB = Sequel.connect('postgres://user:password@localhost/blog')
  # DB << "SET CLIENT_ENCODING TO 'UTF8';"  # also see :encoding param from postgres
  
  DB = Sequel.sqlite('db/quotes.db')

  # load greek collations for sorting (requires sqlite build with ICU support)
  DB << "SELECT icu_load_collation('el_GR', 'greek');"

else

  DB = Sequel.sqlite('db/quotes.db')

  # load greek collations for sorting (requires sqlite build with ICU support)
  DB << "SELECT icu_load_collation('el_GR', 'greek');"

end

require_relative 'authors'
require_relative 'tags'
require_relative 'quotes'
