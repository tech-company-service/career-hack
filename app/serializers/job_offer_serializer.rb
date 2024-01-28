class JobOfferSerializer < ApplicationSerializer
  attributes :id, :name, :description, :technologies

  def technologies
    object.job_offer_technologies.map(&:technology)
  end
end
