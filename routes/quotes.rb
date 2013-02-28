# encoding: utf-8
class Quotes < Sinatra::Application
  get "/" do
    @title = "Welcome to MyApp"        
    "<h1>${@title}</h1>"
  end
end
