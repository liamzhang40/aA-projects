FactoryBot.define do
  factory :user do
    username {
      ["oscarcakes",
      "pattycakes",
      "abbycakes"].sample}
    password "starwars"
  end
end
