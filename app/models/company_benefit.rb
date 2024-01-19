class CompanyBenefit < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :title, :content, presence: true
end
