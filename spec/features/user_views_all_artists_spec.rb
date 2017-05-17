require 'rails_helper'

RSpec.feature "User views all artist" do
  scenario "the welcome page shows all artists" do
    artist = Artist.create!(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist1 = Artist.create!(name: "Taylor Swift", image_path: "https://static.independent.co.uk/s3fs-public/styles/article_medium/public/thumbnails/image/2016/01/29/11/Taylor-Swift-revenge-nerds.jpg")

    visit '/artists'
    expect(page).to have_content artist.name
    # expect(page).to have_content artist1.name

    click_on artist.name
    expect(current_path).to eq("/artists/#{artist.id}")
  end
end


# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page