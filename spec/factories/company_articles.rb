FactoryBot.define do
  factory :company_article do
    title { "サイバーエージェント、生成AIで業務6割減 開発･採用に" }
    description { "株式会社サイバーエージェントが生成AIを用いて業務効率化を図る旨の記事" }
    url { "https://www.nikkei.com/article/DGXZQOUC1615E0W3A011C2000000/" }
    ogp_image_url { "https://www.nikkei.com/article/DGXZQOUC1615E0W3A011C2000000/" }
  end
end
