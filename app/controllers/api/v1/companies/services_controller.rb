class Api::V1::Companies::ServicesController < Api::ApplicationController
  before_action :set_company, only: [:index]

  def index
    # TODO: redis対応を必ずする
    services = @company.company_services
    render json: services, each_serializer: CompanyServiceSerializer
  end

  private

  def set_company
    @company = Company.find_by!(hash_id: params[:company_hash_id])
  end
end
