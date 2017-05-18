require 'rails_helper'

RSpec.feature "User views all songs of a specific artist" do
  scenario "they see song titles sorted alphabetically" do
    artist = create(:artist)
    song1 = artist.songs.create(title: "Waiting in Vain")
    song2 = artist.songs.create(title: "Buffalo Soldier")
    song3 = artist.songs.create(title: "Is this Love")

    visit "artists/#{artist.id}"
    click_on "View Songs"

    expect(page).to have_selector("ul#song_title li:nth-child(1)", text: song2.title)
    expect(page).to have_selector("ul#song_title li:nth-child(3)", text: song1.title)
    expect(page).to have_link(song2.title, href: "/songs/#{song2.id}")
  end
end

# As a user
# Given that an artist and that artist's associated songs exist in the database
# When I visit the individual artist page
# And I click "View songs"
# Then I should see the song titles for that specific artist sorted alphabetically
# And each title should link to the individual song page
