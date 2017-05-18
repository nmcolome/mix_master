require 'rails_helper'

RSpec.feature "User can update song titles" do
  scenario "they enter data to edit a song" do
    artist = create(:artist)
    song = artist.songs.create(title: "Two Loves", artist_id: artist.id)

    visit "/songs/#{song.id}"
    click_on "Edit"
    fill_in "song_title", with: "One Love"
    click_on "Update Song"

    expect(page).to have_content "One Love"
    expect(page).to have_link(artist.name, href: "/artists/#{artist.id}")
  end
end

# As a user
# Given that a song exists in the database
# When I visit that song's show page
# And I click on "Edit"
# And I fill in a new title
# And I click on "Update Song"
# Then I should see the song's updated name
# Then I should see a link to the song artist's individual page