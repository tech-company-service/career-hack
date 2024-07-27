class CompanySelectionPreference < ApplicationRecord
  #
  # Associations
  #
  has_many :user_company_selection_preferences, dependent: :destroy
  has_many :users, through: :user_company_selection_preferences

  #
  # validations
  #
  validates :name, presence: true
end
