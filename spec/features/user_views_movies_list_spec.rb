require "spec_helper"

feature "when the user navigates to the movies index page" do
  scenario "an li of each movie is displayed" do
    CSV.open("movies_test.csv", "a") do |csv|
      csv << [ "Finding Nemo", "2002", "120 minutes" ]
    end

    visit "/movies"

    expect(page).to have_content("Finding Nemo, 2002, 120 minutes runtime")
  end

  scenario "they can click a link to navigate to the new movie form" do 
    visit "/movies"

    expect(page).to have_content("Add a Movie")

    click_link "Add a Movie"

    expect(page).to have_current_path("/movies/new")
  end
end




