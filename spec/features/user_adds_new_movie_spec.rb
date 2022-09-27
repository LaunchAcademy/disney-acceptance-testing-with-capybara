require "spec_helper"

feature "when a user visits the new movie form page" do
  context "if they fill out the form fields successfully" do 
    scenario "they will get redirected back to the index page and see their new movie" do
      # visit the movie form
      visit "/movies/new"

      # fill out the form with valid data
      fill_in("title", with: "Shrek")
      fill_in("release_year", with: "2000")
      fill_in("runtime", with: "90 minutes")

      # submit the form
      click_button "Add New Movie"
      # save_and_open_page

      # make an assertion about seeing the new movie on the index page
      expect(page).to have_content "Shrek"
      expect(page).to have_content "2000"
      expect(page).to have_content "90 minutes"
    end
  end

  context "when a user omits fields in the form" do
    scenario "they get errors describing which fields are blank" do
      # visit the form
      visit "/movies/new"

      # submit the form without adding/typing anything
      click_button "Add New Movie"

      # expect to see error messages
      # save_and_open_page
      expect(page).to have_content "Title is blank"
      expect(page).to have_content "Release Year is blank"
      expect(page).to have_content "Runtime is blank"
    end
  end
end