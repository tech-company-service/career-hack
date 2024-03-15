class CompanyService < ApplicationRecord
  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :name, presence: true
  validates :description, presence: true
end
