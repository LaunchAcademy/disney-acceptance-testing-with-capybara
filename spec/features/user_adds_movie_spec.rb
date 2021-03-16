require "spec_helper"

feature "when a user visits the new movie form page" do
  context "if they fill out the form fields successfully" do 
    scenario "they will get redirected back to the index page and see their new movie" do
      visit "/movies/new"

      fill_in "Title", with: "Moana"
      fill_in "Release Year", with: "2016"
      fill_in "Runtime", with: "120 minutes"

      click_on "Submit Movie"

      # this assumes that after the movie is submitted, that we will be redirected back to the index page

      expect(page).to have_current_path("/movies")

      expect(page).to have_content("Moana")
      expect(page).to have_content("2016")
      expect(page).to have_content("120 minutes")
    end
  end

  context "when a user omits fields in the form" do
    scenario "they get errors describing which fields are blank" do
      visit "/movies/new"

      click_on "Add Movie"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Release year can't be blank")
      expect(page).to have_content("Runtime can't be blank")
    end
  end
end
