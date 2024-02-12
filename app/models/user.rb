class User < ApplicationRecord
  validate :unique_email_across_providers, on: :create

  private

  def unique_email_across_providers
    if User.where.not(provider: self.provider).exists?(email: self.email)
      errors.add(:email, 'は別のプロバイダで既に使用されています')
    end
  end
end
