class Article < ApplicationRecord
  #
  # Associations
  #
  has_many :company_articles
  has_many :companies, through: :company_articles

  #
  # validations
  #
  validates :title, presence: true
  validates :link, presence: true
  validates :published_at, presence: true
end
