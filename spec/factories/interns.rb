FactoryBot.define do
  factory :intern do
    company
    title { "サイバーエージェントの夏インターン" }
    description { "サイバーエージェントでの夏のインターンシップ。プログラミングスキルを活かして、実際のプロジェクトに取り組む絶好の機会です。" }
    link { "https://example.com/internship" }
    entry_deadline_date { 30.days.from_now }
    started_at { 60.days.from_now }
    ended_at { 90.days.from_now }
    period { 30 }
    site { "東京" }
    style_type { 0 }
    recruitment_type { 0 }
  end
end
