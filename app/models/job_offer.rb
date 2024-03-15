class JobOffer < ApplicationRecord
  #
  # Associations
  #
  has_many :job_offer_technologies, dependent: :destroy
  has_many :technologies, through: :job_offer_technologies
  belongs_to :company

  #
  # validations
  #
  validates :name, presence: true
end
