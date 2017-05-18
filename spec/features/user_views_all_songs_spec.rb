require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "they see song titles sorted alphabetically" do
    artist = create(:artist)
    artist2 = create(:artist, name: "Beatles")
    song1 = artist.songs.create(title: "Waiting in Vain")
    song2 = artist.songs.create(title: "Buffalo Soldier")
    song3 = artist.songs.create(title: "Is this Love")
    song4 = artist2.songs.create(title: "Hey Jude")
    song5 = artist2.songs.create(title: "Yesterday")
    song6 = artist2.songs.create(title: "Blackbird")

    visit 'songs/'

    expect(page).to have_selector("ul#song_title li:nth-child(1)", text: song6.title)
    expect(page).to have_selector("ul#song_title li:nth-child(2)", text: song2.title)
    expect(page).to have_selector("ul#song_title li:nth-child(3)", text: song4.title)
    expect(page).to have_selector("ul#song_title li:nth-child(4)", text: song3.title)
    expect(page).to have_selector("ul#song_title li:nth-child(5)", text: song1.title)
    expect(page).to have_selector("ul#song_title li:nth-child(6)", text: song5.title)
    expect(page).to have_link(song1.title, href: "/songs/#{song1.id}")
    expect(page).to have_link(song2.title, href: "/songs/#{song2.id}")
    expect(page).to have_link(song3.title, href: "/songs/#{song3.id}")
    expect(page).to have_link(song4.title, href: "/songs/#{song4.id}")
    expect(page).to have_link(song5.title, href: "/songs/#{song5.id}")
    expect(page).to have_link(song6.title, href: "/songs/#{song6.id}")
  end
end

# As a user
# Given that songs exist in the database
# When I visit the songs index ('/songs')
# Then I should see the titles of all songs in the database sorted alphabetically
# And the titles should each link the individual song page