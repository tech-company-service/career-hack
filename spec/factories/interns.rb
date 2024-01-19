FactoryBot.define do
  factory :intern do
    association :company
    title { "サイバーエージェントの夏インターン" }
    description { "サイバーエージェントでの夏のインターンシップ。プログラミングスキルを活かして、実際のプロジェクトに取り組む絶好の機会です。" }
    link { "https://example.com/internship" }
    entry_deadline_date { Time.now + 30.days }
    started_at { Time.now + 60.days }
    ended_at { Time.now + 90.days }
    period { 30 }
    site { "東京" }
    style_type { 0 }
    recruitment_type { 0 }
  end
end