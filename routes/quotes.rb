# encoding: utf-8
class Quotes < Sinatra::Application
  get "/" do
    quote = Quote.new
    quote.author = 'Meme'
    @title = "Welcome to MyApp"        
    "<h1>#{@title} - #{ENV['RACK_ENV']} - #{quote.author}</h1>"
  end
end
