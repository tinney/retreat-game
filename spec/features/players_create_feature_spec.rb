require "rails_helper"

RSpec.feature "Create Player", type: :feature do
  scenario "A Player can be created" do
    visit "/players/new"

    fill_in "Name", :with => "Tom & Jerry"
    click_button "Create"

    expect(page).to have_text("Tom & Jerry")
  end
end