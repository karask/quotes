# encoding: utf-8

class Quotes < Sinatra::Application

  before do
    @title = "Το'πε..."

    # get a random quote from first 500 quotes
    offset = rand(500)
    # join tables and get one row after offset - returns dataset with one element!
    quotes_with_authors = DB[:quotes].join(:authors, :id => :author_id).limit(1, offset)
    @random_quote = quotes_with_authors.first
  end


  get "/" do
    # get all authors for typeahead search
    authors = Author.order(:name).all
    
    # use both name and alt_name for typeahead matching (if too many we can use a JS file)
    # TODO
    @authors = authors.map { |a| a[:name] }.to_s

    # get all tags for typeahead search
    tags = Tag.order(:name).all
    # use tag name for typeahead matching
    @tags = tags.map { |t| t[:name] }.to_s

#    author = Author[:name => "Βολταίρος"]
#    @quotes = Quote.where(:author_id => author.id)
#    @quotes = Quote.where('author_id == ?', Author.where(:name => "Βολταίρος").first.id)

    haml :welcome, :layout => true
  end


  post "/author_quotes" do
    unless params[:author].empty?
      @author = params[:author]
    else
      @author = "Ανώνυμος" 
    end

    @quotes_list = DB[:quotes].join(:authors, :id => :author_id).where(:name => @author).all

    haml :author_quotes, :layout => true
  end


  post "/tag_quotes" do
    unless params[:tag].empty?
      @tag = params[:tag]
    else
      @tag = "Άγνωστο"
    end

    # get tag_id for tag
    tag_id = Tag.where(:name => @tag).first[:id]
    @quotes_list = DB[:quotes].join(:quotes_tags, :quote_id => :id).where(:tag_id => tag_id).all

    haml :tag_quotes, :layout => true
  end


end
