class Api::V1::Companies::BenefitsController < Api::ApplicationController
  before_action :set_company, only: [:index]

  def index
    # TODO: redis対応を必ずする
    benefits = @company.company_benefits
    render json: benefits, each_serializer: CompanyBenefitSerializer
  end

  private

  def set_company
    @company = Company.find_by!(hash_id: params[:company_hash_id])
  end
end
