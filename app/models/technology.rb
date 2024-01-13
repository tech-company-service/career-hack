class Technology < ApplicationRecord
  #
  # Associations
  #
  has_many :technology_technology_categories
  has_many :technology_categories, through: :technology_technology_categories

  #
  # validations
  #
  validates :name, presence: true
  validates :description, presence: true
end
