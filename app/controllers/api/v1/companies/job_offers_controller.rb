class Api::V1::Companies::JobOffersController < Api::ApplicationController
  before_action :set_company, only: [:index]

  def index
    # TODO: redis対応を必ずする
    job_offers = @company.job_offers
    render json: job_offers, each_serializer: JobOfferSerializer
  end

  private

  def set_company
    @company = Company.find_by!(hash_id: params[:company_hash_id])
  end
end
