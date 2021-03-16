class Movie 
  attr_reader :title, :runtime, :release_year
  def initialize 
    # instance variables
  end

  def self.find_all 
    movies = []
    CSV.foreach(movies_csv, headers: true) do |row|
      movies << Movie.new(row[:title])
    end
    return movies 
  end

end

