# encoding: utf-8
require 'rubygems'
require 'sequel'

DB = Sequel.sqlite(ARGV[0])

DB.create_table :quotes do
  primary_key :id
  String :quote
  
  # many to one with authors
  foreign_key :author_id, :authors
end

DB.create_table :authors do
  primary_key :id
  String :name, :size => 50, :unique => true
  String :alt_name, :size => 50, :unique => true
end

DB.create_table :tags do
  primary_key :id
  String :name, :size => 25, :unique => true
end

# many to many quotes - tags table 
DB.create_table :quotes_tags do
  foreign_key :quote_id, :quotes
  foreign_key :tag_id, :tags
end

