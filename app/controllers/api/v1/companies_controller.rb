class Api::V1::CompaniesController < ApplicationController
  def index
    Rails.cache.fetch("companies", expires_in: 1.day) do
      companies = Company.all
      ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    end
  end

  def show
    company = Company.includes(company_technology_technology_categories: { technology_technology_category: [:technology, :technology_category] })
                     .find(params[:id])
    company = Company.includes(company_services: [:company]).find(params[:id])
    render json: company, serializer: CompanySerializer
  end
end