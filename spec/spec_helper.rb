ENV["RACK_ENV"] ||= "test"

require "rspec"
require "capybara/rspec"
require "csv"

require_relative "../server"

Capybara.app = Sinatra::Application

def csv_file
  if ENV["RACK_ENV"] == "test"
    "data/movies_test.csv"
  else
    "data/movies.csv"
  end
end

def reset_csv
  CSV.open(csv_file, "w", headers: true) do |csv|
    csv << ["title", "release_year", "runtime"]
  end
end


RSpec.configure do |config|
  config.before(:suite) do
    reset_csv
  end

  config.after(:each) do
    reset_csv
  end

  # ------

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
