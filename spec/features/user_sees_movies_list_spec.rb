require "spec_helper"

feature "when the user navigates to the movies index page" do
  scenario "an li of each movie is displayed" do
    # add to the CSV file before checking the page
    CSV.open("movies_test.csv", "a") do |csv_file|
      csv_file << ["Mulan", "1998", "88 minutes"]
    end

    # navigate to the index page "/movies"
    visit "/movies"
    # save_and_open_page

    # assertions about what we expect to see on the page - title, release year, runtime
    expect(page).to have_content "Mulan"
    expect(page).to have_content "1998"
    expect(page).to have_content "88 minutes"
  end

  scenario "they can click a link to navigate to the new movie form" do 
    visit "/"
    # visit "/movies"
    # save_and_open_page
    # the user can click the link
    click_link "Add a Movie"
    # check the current path
    expect(page).to have_current_path "/movies/new"
  end
end