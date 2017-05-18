FactoryGirl.define do
  sequence :song do |n|
    title "#{n} Love"
    user_id "#{n}"
  end
end