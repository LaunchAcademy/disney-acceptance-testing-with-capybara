require "sinatra"
require "pry"
require "csv"
require 'sinatra/reloader' if development?


set :bind, "0.0.0.0"
set :views, File.join(File.dirname(__FILE__), "views")

#helper method
def csv_file
  if ENV["RACK_ENV"] == "test"
    "movies_test.csv"
  else
    "movies.csv"
  end
end

get "/" do
  redirect "/movies"
end

get "/movies" do
  @movies = CSV.readlines(csv_file, headers: true)

  erb :"movies/index" 
end

get '/movies/new' do
  erb :"movies/new"
end

post "/movies" do
  # binding.pry
  title = params["title"]
  release_year = params["release_year"]
  runtime = params["runtime"]

  if title.strip == "" || release_year.strip == "" || runtime.strip == ""
    # sad path
    @errors = []

    if title.strip == ""
      @errors << "Title is blank"
    end
    if release_year.strip == ""
      @errors << "Release Year is blank"
    end
    if runtime.strip == ""
      @errors << "Runtime is blank"
    end

    erb :"movies/new"
  else
    # happy path
    CSV.open(csv_file, "a") do |csv|
      csv << [title, release_year, runtime]
    end

    redirect "/movies"
  end

end

