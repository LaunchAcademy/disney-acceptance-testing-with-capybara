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

  @movies = CSV.readlines("movies.csv", headers: true)

  erb(:"movies/index")
end

get '/movies/new' do
  erb :"movies/new"
end

#helper method
def csv_file
  if ENV["RACK_ENV"] == "test"
    "movies_test.csv"
  else
    "movies.csv"
  end
end