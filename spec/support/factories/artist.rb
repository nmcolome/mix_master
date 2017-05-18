FactoryGirl.define do
  factory :artist do
    name        "Bob Marley"
    image_path  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    # factory :artist_with_5_songs do
    #   after(:build) do |artist|
    #     create_list(:song, 10, user_id: user.id)
    #   end
    # end
  end
end
