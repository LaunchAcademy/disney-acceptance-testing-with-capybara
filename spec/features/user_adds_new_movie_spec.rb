require "spec_helper"

feature "when a user visits the new movie form page" do
  context "if they fill out the form fields successfully" do 
    scenario "they will get redirected back to the index page and see their new movie" do
      visit "/movies/new"

      fill_in("Title", with: "Oliver and Company")
      fill_in("Release Year", with: "1991")
      fill_in("Runtime", with: "90 minutes")

      click_button "Add New Movie"

      expect(page).to have_current_path("/movies")
      expect(page).to have_content("Oliver and Company")
    end
  end

  context "when a user omits fields in the form" do
    scenario "they get errors describing which fields are blank" do
      visit "/movies/new"

      click_button "Add New Movie"

      expect(page).to have_content("Title is blank")
      expect(page).to have_content("Release Year is blank")
      expect(page).to have_content("Runtime is blank")
    end
  end
end