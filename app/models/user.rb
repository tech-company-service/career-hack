class User < ApplicationRecord
  #
  # Associations
  #
  has_many :user_technologies, dependent: :destroy
  has_many :technologies, through: :user_technologies
  has_many :user_desired_industries, dependent: :destroy
  has_many :industries, through: :user_desired_industries
  has_many :user_company_selection_preferences, dependent: :destroy
  has_many :company_selection_preferences, through: :user_company_selection_preferences

  #
  # validations
  #
  validate :unique_email_across_providers, on: :create

  #
  # Enums
  #
  enum target_position: {
    frontend_engineer: 0,
    backend_engineer: 1,
    mobile_app_engineer: 2,
    infra_engineer: 3,
    security_engineer: 4,
    se: 5,
    data_scientist: 6,
    game_engineer: 7,
    game_producer_director: 8,
    ui_ux_designer: 9,
    web_designer: 10,
    product_manager: 11
  }

  private

  def unique_email_across_providers
    return unless User.where.not(provider:).exists?(email:)

    errors.add(:email, 'は別のプロバイダで既に使用されています')
  end
end
