# encoding: utf-8

class Quotes < Sinatra::Application
  get "/" do
    @a = Author.new
    @a.name = "mememe"
    @title = "Welcome to MyApp"        
    haml :welcome
  end
end
