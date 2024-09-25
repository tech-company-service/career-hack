class UserCompanySelectionPreference < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company_selection_preference
  belongs_to :user
end
