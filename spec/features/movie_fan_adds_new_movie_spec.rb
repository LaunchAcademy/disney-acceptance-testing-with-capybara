require "spec_helper"

feature "when the user visits the new movie form" do
  scenario "they see the correct path in their url" do
    visit "/movies"

    click_link "Add A Movie"

    expect(page).to have_content("New Movie Form")
    expect(page).to have_current_path("/movies/new")
  end

  context "the user fills out the form correctly" do
    scenario "which persists the new movie and redirects to the movies index page" do
      visit "/movies/new"

      fill_in "Title", with: "Finding Nemo"
      fill_in "Release Year", with: "2002"
      fill_in "Runtime", with: "120 minutes"

      click_on "Add Movie"

      expect(page).to have_content("Movies I Have Watched")
      expect(page).to have_content("Finding Nemo")
    end
  end

  context "the user fills fails to add a title" do
    scenario "the user sees an error message telling them they were being a silly billy" do
      visit "/movies/new"

      click_on "Add Movie"

      expect(page).to have_content("New Movie Form")
      expect(page).to have_content("You forget the title you silly billy")
    end
  end
end
