require 'rails_helper'

RSpec.feature "User deletes an artist song" do
  scenario "deletes a song and goes back to the last page he visited" do
    artist = create(:artist)
    song1 = artist.songs.create!(title: "Waiting in Vain")
    song2 = artist.songs.create!(title: "Buffalo Soldier")

    visit "/artists/#{artist.id}"
    click_on "View Songs"
    click_on "#{song1.title}"
    click_on "Delete"
    expect(current_path).to eq("/artists/#{artist.id}/songs")
    expect(page).to_not have_content song1.title

    visit "/songs"
    click_on "#{song2.title}"
    click_on "Delete"
    expect(current_path).to eq("/songs")
    expect(page).to_not have_content song2.title
  end
end

# As a user
# Given that an artist and a song for that artist exist in the database
# When I visit the artist's song index ('/artists/1/songs')
# And I click on "Delete"
# Then I should be back on whatever page I was on before (the artist's song index page)
# And I should not see the the song title