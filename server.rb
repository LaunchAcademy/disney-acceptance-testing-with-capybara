require "sinatra"
require "pry"
require "csv"

set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")

get "/" do
  redirect "/movies"
end

get "/movies" do
  @movies = []

  CSV.foreach(csv_file, headers: true) do |row|
    @movies << row.to_h
  end
  
  erb :"movies/index"
  # Note: this is syntax (with quotes) if we have our erb files in a subfolder!
end


# Helper Methods
