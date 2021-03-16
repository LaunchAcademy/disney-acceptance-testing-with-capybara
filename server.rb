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

post '/movies' do
  title = params["title"]
  release_year = params["release_year"]
  runtime = params["runtime"]

  if title.strip != "" && release_year.strip != "" && runtime.strip != ""
    CSV.open(csv_file, "a") do |csv|
      csv << [title, release_year, runtime]
    end
  
    redirect "/movies"
  else
    @errors = "Error!"

    if title.strip == ""
      @errors += "Title can't be blank"      
    end

    if release_year.strip == ""
      @errors += "Release year can't be blank"      
    end

    if runtime.strip == ""
      @errors += "Runtime can't be blank"      
    end

    erb :"movies/new"
  end
end

#helper methods
def csv_file
  if ENV["RACK_ENV"] == "test"
    "movies_test.csv"
  else
    "movies.csv"
  end
end