FactoryBot.define do
  factory :company_about do
    company
    title { "vision | 21世紀を代表する会社を創る" }
    content { "Mission Statement インターネットという成長産業から軸足はぶらさない。" }
  end
end
