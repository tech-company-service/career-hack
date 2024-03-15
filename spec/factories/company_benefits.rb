FactoryBot.define do
  factory :company_benefit do
    company
    title { "女性活躍促進制度 macalonパッケージ" }
    content { "社員が長く継続して働くことができる職場環境の向上を目指して9つの制度をパッケージ化した独自制度。" }
  end
end
