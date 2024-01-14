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
  validates :occupation_type, presence: true

  enum occupation_type: { backend: 0, web_frontend: 1, game_client: 2, devops: 3, qa: 4, data_engineer: 5, data_scientist: 6, security: 7, mobile: 8, machine_learning: 9, infla: 10 }
end
