# encoding: utf-8

class Quotes < Sinatra::Application
  get "/" do
    @title = "Το'πε..."

    # get a random quote from first 500 quotes
    offset = rand(500)
    quotes_with_authors = DB[:quotes].join(:authors, :id => :author_id).limit(1, offset).first
    @random_quote = quotes_with_authors

    # get all authors for typeahead search
    authors = Author.order(:name).all
    @authors = authors.map { |a| a[:name] }.to_s

    # get all tags for typeahead search
    tags = Tag.order(:name).all
    @tags = tags.map { |t| t[:name] }.to_s

#    author = Author[:name => "Βολταίρος"]
#    @quotes = Quote.where(:author_id => author.id)
#    @quotes = Quote.where('author_id == ?', Author.where(:name => "Βολταίρος").first.id)

#    @authors = Author.order(:name).all
#    @tags = Tag.order(:name).all

    haml :welcome, :layout => true
  end
end
