class Technology < ApplicationRecord
  #
  # Associations
  #
  has_many :job_offer_technologies
  has_many :job_offers, through: :job_offer_technologies

  #
  # validations
  #
  validates :name, presence: true
  validates :description, presence: true
  validates :category_type, presence: true

  enum category_type: { backend: 0, frontend: 1, mobile: 2, infla: 3, machine_learning: 4, data_science: 5}
end