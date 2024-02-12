class JobOfferSerializer < ApplicationSerializer
  attributes :id, :name, :description

  # def technologies
  #   object.job_offer_technologies.map(&:technology)
  # end
end
