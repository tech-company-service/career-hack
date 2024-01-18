class JobOfferSerializer < ApplicationSerializer
  attributes :id, :occupation_type, :technologies

  # def occupation_type
  #   # 後でI18n対応
  # end

  def technologies
    object.job_offer_technologies.map(&:technology)
  end
end
