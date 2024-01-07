class Api::V1::CompaniesController < ApplicationController
  def index
    json_companies = Rails.cache.fetch("companies", expires_in: 1.day) do
      companies = Company.all
      ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    end

    render json: json_companies
  end
end