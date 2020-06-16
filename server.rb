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

  CSV.foreach("movies.csv", headers: true) do |row|
    @movies << row.to_h
  end

  # @movies = CSV.readlines("movies.csv", headers: true)

  erb(:"movies/index")
  # Note: this is syntax (with quotes) if we have our erb files in a subfolder!
end

get "/movies/new" do
  erb :"movies/new"
end

post "/movies" do
  title = params[:title]
  release_year = params[:release_year]
  runtime = params[:runtime]

  if title == ""
    @error = "You forget the title you silly billy"

    erb :"movies/new"
  else
    CSV.open("movies.csv", "a") do |csv| 
      csv << [title, release_year, runtime]
    end

    redirect "/movies"
  end

end
