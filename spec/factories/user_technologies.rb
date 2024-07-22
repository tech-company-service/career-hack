FactoryBot.define do
  factory :user_technologies do
    user
    technology
    proficiency_level { 0 }
  end
end
