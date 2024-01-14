class Api::V1::CompaniesController < ApplicationController
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
    render json: company, serializer: CompanySerializer
  end
end
