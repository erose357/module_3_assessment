FactoryBot.define do
  factory :item do
    sequence :name do |n|
      "Robbie #{n}"
    end
    description "Awesome"
    image_url "https://n6-img-fp.akamaized.net/free-photo/robot-doing-the-peace-sign_1048-3527.jpg?size=338&ext=jpg"
  end
end
