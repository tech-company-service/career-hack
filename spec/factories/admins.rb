FactoryBot.define do
  factory :admin do
    email { "admin@example.com" }
    encrypted_password { "$2a$12$dzue1i4rnnqXtEzyh3nffuk0Yde7HPdchqluWkPez24tHFVZpQZsw" }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
  end
end
