feature "user adds a movie" do
  scenario "A user can navigate to the new movie form from the index page" do
    visit "/"

    click_link "Add A Movie"

    expect(page).to have_current_path("/movies/new")
    expect(page).to have_content("New Movie Form")
  end

  context "when a user fills out all fields in the form" do
    scenario "they are redirected to the index page and can see the new movie info" do
      visit "/movies/new"

      fill_in "Title", with: "Moana"
      fill_in "Release Year", with: "2016"
      fill_in "Runtime", with: "120 minutes"

      click_on "Add Movie"

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