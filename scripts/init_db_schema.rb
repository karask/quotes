# encoding: utf-8
require 'sequel'

DB = Sequel.sqlite(ARGV[1])

DB.create_table :quotes do
  primary_key :id
  varchar :name, :size => 50, :unique => true
end


