class CompanyAbout < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :title, presence: true
  validates :content, presence: true
end