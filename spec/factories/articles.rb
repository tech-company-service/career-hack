FactoryBot.define do
  factory :article do
    title { "サイバーエージェント、生成AIで業務6割減 開発･採用に" }
    description { "株式会社サイバーエージェントが生成AIを用いて業務効率化を図る旨の記事" }
    link { "https://www.nikkei.com/article/DGXZQOUC1615E0W3A011C2000000/" }
    published_at { "2023-10-17" }
  end
end
