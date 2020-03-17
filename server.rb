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

get "/movies/new" do
  erb :"movies/new"
end

post "/movies/new" do
  title = params["movie_title"]
  release_year = params["movie_release_year"]
  runtime = params["movie_runtime"]

  if title.strip != "" && release_year.strip != "" && runtime.strip != ""
    CSV.open(csv_file, "a") do |csv|
      csv << [ title, release_year, runtime ]
    end

    redirect "/movies"
  else
    @errors = "Error! "

    if title.strip == ""
      @errors += "Please provide a title "
    end

    if release_year.strip == ""
      @errors += "Please provide a release year "
    end

    if runtime.strip == ""
      @errors += "Please provide a runtime "
    end

    erb :"movies/new"
  end

end


# Helper Methods

def csv_file
  if ENV["RACK_ENV"] == "test"
    "data/movies_test.csv"
  else
    "data/movies.csv"
  end
end

def reset_csv
  CSV.open(csv_file, "w", headers: true) do |csv|
    csv << ["title", "release_year", "runtime"]
  end
end
