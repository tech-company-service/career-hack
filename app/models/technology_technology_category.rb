class TechnologyTechnologyCategory < ApplicationRecord
  #
  # Associations
  #
  has_many :company_technology_technology_categories
  has_many :companies, through: :company_technology_technology_categories
  belongs_to :technology
  belongs_to :technology_category
end
