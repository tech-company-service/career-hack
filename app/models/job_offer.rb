class JobOffer < ApplicationRecord
  #
  # Associations
  #
  has_many :job_offer_technologies
  has_many :technologies, through: :job_offer_technologies
  belongs_to :company

  #
  # validations
  #
  validates :name, presence: true
end
