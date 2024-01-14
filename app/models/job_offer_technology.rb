class JobOfferTechnology < ApplicationRecord
  #
  # Associations
  #
  belongs_to :job_offer
  belongs_to :technology

  #
  # validations
  #
  validates :job_offer_id, presence: true
  validates :technology_id, presence: true
end