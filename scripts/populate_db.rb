# encoding: utf-8
require 'rubygems'
require 'csv'

# inits appropriate database called: DB
require_relative '../models/init.rb'

# second arg is the name of the .csv to read quotes from
# Format of .csv is: quote|name|alt_name|tags

CSV.foreach('data/quotes_development597.csv', :col_sep => '|' ) do |row|
  quote_str = row[0]
  name_str = row[1]
  alt_name_str = row[2] || name_str
  tags_arr = row[3].split(",")

  # add author if not in authors table
  author = Author[:name => name_str] || 
           Author.create(:name => name_str, :alt_name => alt_name_str, :quote_count => 0)

  # add any of the tags not in tags table
  tags = []  # to place quote's tags
  tags_arr.each do |tag_str|
    tag = Tag[:name => tag_str] || Tag.create(:name => tag_str, :quote_count => 0)
    tags << tag
  end

  # add a new quote
  DB.transaction do
    quote = Quote.create(:quote => quote_str)
    quote.author = author.update(:quote_count => author.quote_count + 1)
    tags.each do |t| 
      quote.add_tag(t.update(:quote_count => t.quote_count + 1)) 
    end
    quote.save
  end

end

