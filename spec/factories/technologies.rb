FactoryBot.define do
  factory :technology do
    name { "Go" }
    description do
      "Goは表現力が豊かで、簡潔、クリーン、かつ効率的である。その並行性メカニズムにより、マルチコアやネットワーク化されたマシンを最大限に活用するプログラムを簡単に書くことができ、また、その斬新な型システムにより、柔軟でモジュール化されたプログラムを構築することができる。"
    end
    category_type { 0 }
  end
end
