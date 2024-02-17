FactoryBot.define do
  factory :job_offer do
    company
    name { "バックエンドエンジニア" }
    description { "多種多様な言語での開発に加え、パブリッククラウド(AWS,GCP)・プライベートクラウドなどを利用したシステム構築など幅広い領域の業務に携わります。" }
  end
end
