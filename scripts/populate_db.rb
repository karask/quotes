# encoding: utf-8
require 'rubygems'
require 'csv'

# inits appropriate database called: DB
require_relative '../models/init.rb'

# second arg is the name of the .csv to read quotes from
# Format of .csv is: quote|name|alt_name|tags

CSV.foreach('data/quotes_development.csv', :col_sep => '|' ) do |row|
  quote_str = row[0]
  name_str = row[1]
  alt_name_str = row[2] || name_str
  tags_arr = row[3].split(",")

  # add author if not in authors table
  author = Author[:name => name_str]
  unless author
    puts "not there, add author"
    author = Author.create(:name => name_str, :alt_name => alt_name_str)
  end

  # add any of the tags not in tags table
  tags = []  # to place quote's tags
  tags_arr.each do |tag_str|
    tag = Tag[:name => tag_str]
    unless tag
      puts "tag not there, add"
      tags << Tag.create(:name => tag_str)
    else
      tags << tag
    end
  end

  # add a new quote
  quote = Quote.create(:quote => quote_str)
  quote.author = author
  tags.each { |t| quote.add_tag(t) }
  quote.save

end

