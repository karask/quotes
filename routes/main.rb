# encoding: utf-8

class Quotes < Sinatra::Application

  configure do
    set :page_size, 20
  end


  before do
    @title = "Το'πε..."

    # get a random quote from first 500 quotes
    offset = rand(500)
    # join tables and get one row after offset - returns dataset with one element!
    quotes_with_authors = DB[:quotes].join(:authors, :id => :author_id).limit(1, offset)
    @random_quote = quotes_with_authors.first
  end


  # define a method/route for when both get and post are identical
  def self.get_or_post(path, opts={}, &block)
    get(path, opts, &block)
    post(path, opts, &block)
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


  get_or_post  "/author_quotes" do
    unless params[:author].empty?
      @author = params[:author]
    else
      @author = "Ανώνυμος" 
    end

    @page = get_page_param params[:page]

    # calculate pages
    all_quotes_ds = DB[:quotes].join(:authors, :id => :author_id).where(:name => @author)
    @pages = all_quotes_ds.count / settings.page_size + 1

    page_offset = (@page - 1) * settings.page_size

    # get author's quotes for one page
    @quotes_list = all_quotes_ds.limit(settings.page_size, page_offset).all

    haml :author_quotes, :layout => true
  end


  get_or_post "/tag_quotes" do
    unless params[:tag].empty?
      @tag = params[:tag]
    else
      @tag = "Άγνωστο"
    end

    @page = get_page_param params[:page]

    # get all tag's quotes
    begin
      tag_id = Tag.where(:name => @tag).first[:id]
    rescue Exception => e
      tag_id = 0
    end
    
    all_quotes_ds = DB[:quotes].join(:quotes_tags, :quote_id => :id).where(:tag_id => tag_id)
 
    # calculate pages
    @pages = all_quotes_ds.count / settings.page_size + 1

    page_offset = (@page - 1) * settings.page_size

    # get tag's quotes for one page
    @quotes_list = all_quotes_ds.limit(settings.page_size, page_offset).all

    haml :tag_quotes, :layout => true
  end


end
