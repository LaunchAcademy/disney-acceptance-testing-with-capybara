feature "user adds a movie" do
  before(:each) do
    reset_csv
  end

  scenario "user navigates to new movie form from index page" do
    visit "/"
    click_link "Add a Movie"

    expect(page).to have_current_path("/movies/new")
    expect(page).to have_content("Add a Movie Here!")
  end

  scenario "user fills in title, release year, runtime" do
    visit "/movies/new"

    fill_in "Title", with: "Frozen"
    fill_in "Release Year", with: "2017"
    fill_in "Runtime", with: "90 minutes"

    click_button "Add Movie"

    expect(page).to have_current_path("/movies")
    expect(page).to have_content("Frozen")
    expect(page).to have_content("2017")
    expect(page).to have_content("90")
  end

  scenario "user omits title" do
    visit "/movies/new"
    
    fill_in "Release Year", with: "2017"
    fill_in "Runtime", with: "90 minutes"

    click_button "Add Movie"

    expect(page).to have_content("Error!")
    expect(page).to have_content("Please provide a title")
    expect(page).to_not have_content("90 minutes")
    expect(page).to have_current_path("/movies/new")
  end
end
