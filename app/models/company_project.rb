class CompanyProject < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :name, presence: true
end
