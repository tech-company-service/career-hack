FactoryBot.define do
  factory :company_service do
    company
    name { "ABEMA" }
    description { "testtest" }
    launched_at { "2020-01-01" }
    url { "https://example.com" }
  end
end
