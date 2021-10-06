require "spec_helper"

feature "when the user navigates to the movies index page" do
  scenario "an li of each movie is displayed" do
    CSV.open("movies_test.csv", "a") do |csv|
      csv << ["Beauty and the Beast", "1991", "84 minutes"]
    end

    visit "/movies"
    
    # see a title/header
    expect(page).to have_content("Movies I Have Watched")
    
    # to see list of movies
    expect(page).to have_content("Beauty and the Beast, 1991, 84 minutes runtime")
  end

  scenario "they can click a link to navigate to the new movie form" do 
    
    visit "/movies"
    
    # click link/button
    click_link "Add a Movie"
    # save_and_open_page
    # expect to see ...
    expect(page).to have_content("New Movie Form")
    # expect URL to have changed
    expect(page).to have_current_path("/movies/new")
  end
end