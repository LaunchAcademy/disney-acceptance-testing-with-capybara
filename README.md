This repo is for the Launch Academy Week 2 clinic on Capybara testing with Sinatra.

Goals:
* Write happy-path and sad-path tests for the user story below:

```
# User Story
# ----------
# As a movie viewing fan
# I want to see a list of my favorite movies
# So that I can recall which are dope

# Acceptance Criteria
# -------------------
# * I can visit the page when I navigate to /movies 
# * I want to see the title, year and runtime of each movie

# User Story
# ----------
# As a movie viewing fan
# I want to add a disney movie in a movie form
# So that I can show my friends what I've seen

# Acceptance Criteria
# -------------------
# * I can visit the page when I navigate to /movies 
# * I must enter a title
# * I must enter a release year
# * I must enter a runtime
# * If I forget a field, errors are displayed
```


## Tips 
* Make sure to use the test CSV
* review the new spec_helper before beginning
* review the provided CSV, erb and server.rb files

## Useful methods from Capybara
*  click_link "link text"
* click "link or button text" 
* `fill_in "label", with: "value"`
* `click_button "button text"`

### Matchers 
* `expect(page).to have_current_path("/the-path-want-to-chekck")`
*  `expect(page).to have_content("text I am looking for")`




