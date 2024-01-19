class Api::V1::CompaniesController < Api::ApplicationController
  def index
    # 現状、redisへのキャッシュはできていない
    res_companies = Rails.cache.fetch("companies", expires_in: 1.day) do
      companies = Company.all
      ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    end
    render json: res_companies
  end

  def show
    company = Company.find(params[:id])
    company_services = company.company_services if options.include?(:company_services)
    job_offers = company.job_offers if options.include?(:job_offers)
    interns = company.interns if options.include?(:interns)

    company = Company.includes(company_articles: [:article]).find(params[:id]) if  options.include?(:company_articles)

    render json: company, serializer: CompanySerializer, scope: options, scope_name: :options
  end
end
