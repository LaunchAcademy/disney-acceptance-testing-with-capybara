require "spec_helper"

feature "when a user visits the new movie form page" do
  context "if they fill out the form fields successfully" do 
    scenario "they will get redirected back to the index page and see their new movie" do
      
      visit "/movies/new"
      # title
      # release_year
      # runtime

      # simulate filling in form
      fill_in "Title", with: "Moana"
      fill_in "Release Year", with: "2016"
      fill_in "Runtime", with: "90 minutes"
      
      # submit the form
      click_button "Add New Movie"

      # expect URL path to have changed
      expect(page).to have_current_path("/movies")
      # expect page to now have content ...
      expect(page).to have_content("Moana")
      expect(page).to have_content("2016")
      expect(page).to have_content("90 minutes")
    end
  end

  context "when a user omits fields in the form" do
    scenario "they get errors describing which fields are blank" do
      
      visit "/movies/new"
      
      # submit without filling in any info
      click_button "Add New Movie"

      # expect path to not have changed
      expect(page).to have_current_path("/movies/new")
      # expect to see error messages
      expect(page).to have_content("Title is blank")
      expect(page).to have_content("Release Year is blank")
      expect(page).to have_content("Runtime is blank")
    end
  end
end