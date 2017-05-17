require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they enter data to create a new song" do
    artist = create(:artist)

    visit "artists/#{artist.id}/songs"
    click_on "New Song"

    fill_in "song_title", with: "Is This Love"
    click_on "Create Song"

    expect(page).to have_content "Is This Love"
    expect(page).to have_link(artist.name, href: "/artists/#{artist.id}")
  end
end

# As a user
# Given that artists exist in the database
# When I visit the artist songs index
# And I click "New song"
# And I fill in the title
# And I click "Create Song"
# Then I should see the song name
# And I should see a link to the song artist's individual page