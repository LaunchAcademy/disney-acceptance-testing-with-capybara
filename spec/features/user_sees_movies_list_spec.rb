require "spec_helper"

feature "when the user navigates to the movies index page" do
  scenario "an li of each movie is displayed" do
    # add to the CSV file before checking the page
    CSV.open("movies_test.csv", "a") do |csv_file|
      csv_file << ["The Great Mouse Detective", "1984", "80 minutes"]
    end

    visit "/movies" 

    expect(page).to have_content("The Great Mouse Detective")
    expect(page).to have_content("1984")
    expect(page).to have_content("80 minutes")
  end

  scenario "they can click a link to navigate to the new movie form" do 
      visit "/movies" 

      click_link "Add a Movie"
      expect(page).to have_current_path("/movies/new")
  end
end