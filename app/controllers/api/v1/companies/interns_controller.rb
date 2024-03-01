class Api::V1::Companies::InternsController < Api::ApplicationController
  before_action :set_company, only: [:index, :show]

  def index
    # TODO: redis対応を必ずする
    interns = @company.interns
    render json: interns, each_serializer: InternSerializer
  end

  def show
    intern = @company.interns.find(params[:id])
    render json: intern, serializer: InternSerializer
  end

  private

  def set_company
    @company = Company.find_by!(hash_id: params[:company_hash_id])
  end
end
