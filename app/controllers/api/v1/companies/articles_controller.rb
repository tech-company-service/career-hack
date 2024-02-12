class Api::V1::Companies::ArticlesController < Api::ApplicationController
  before_action :set_company, only: [:index]

  def index
    # TODO: redis対応を必ずする
    articles = @company.company_articles
    render json: articles, each_serializer: CompanyArticleSerializer
  end

  private

  def set_company
    @company = Company.find_by!(hash_id: params[:company_hash_id])
  end
end