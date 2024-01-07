FactoryBot.define do
  factory :company do
    name { "test株式会社" }
    description { "testというサービスを自社開発しています" }
    address { "東京都渋谷区test1-2-34" }
    average_salary { 300_000 }
    initial_salary { 200_000 }
    average_age { 30.5 }
    employees { 50 }
    recruit_url { "https://www.example.com/recruit" }
    hash_id { SecureRandom.alphanumeric(15) }
  end
end
