require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they enter data to change artist information" do
    artist = Artist.create!(name: "Rob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit "/artists/#{artist.id}"
    click_on "Edit"
    fill_in "artist_name", with: "Bob Marley"
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image