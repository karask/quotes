# encoding: utf-8
class Quotes < Sinatra::Application
  get "/" do
#    a = Author.new
#    a.name = "mememe"
    @title = "Welcome to MyApp"        
    "<h1>#{@title} - #{ENV['RACK_ENV']} - #{Author[1].name}</h1>"
  end
end
