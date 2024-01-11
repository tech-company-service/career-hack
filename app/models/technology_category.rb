class TechnologyCategory < ApplicationRecord
  #
  # Associations
  #
  has_many :company_technology_technology_categories
  has_many :technology_technology_categories, through: :company_technology_technology_categories

  #
  # validations
  #
  validates :name, presence: true
end
