class User < ApplicationRecord
  validate :unique_email_across_providers, on: :create

  private

  def unique_email_across_providers
    return unless User.where.not(provider:).exists?(email:)

    errors.add(:email, 'は別のプロバイダで既に使用されています')
  end
end
