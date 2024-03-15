class JobOfferTechnology < ApplicationRecord
  #
  # Associations
  #
  belongs_to :job_offer
  belongs_to :technology

  #
  # validations
  #
end
