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

  # add a new quote
  quote = Quote.create(:quote => quote_str)

  # add author if not in authors table and add to quote
  author = Author[:name => name_str]
  unless author
    puts "not there, add author"
    quote.author = Author.create(:name => name_str, :alt_name => alt_name_str)
  else
    puts "author there, just add"
    quote.author = author
  end

  # add any of the tags not in tags table and add to quote
  tags_arr.each do |tag_str|
    tag = Tag[:name => tag_str]
    unless tag
      puts "tag not there, add"
      quote.add_tag(Tag.create(:name => tag_str))
    else
      puts "tag there"
      quote.add_tag(tag)
    end
  end

  quote.save

#  tags.each do |t|
#    puts t
#  end

end

# for each quote 
#   check if author exists, if not create author
#   for each tag check if it exists, if not create tag
#   create quote
#
