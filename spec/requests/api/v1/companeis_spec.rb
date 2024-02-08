require 'rails_helper'

RSpec.describe 'Api::V1::CompaniesController', type: :request do
  describe 'GET /api/v1/companies' do
    let!(:companies) { create_list(:company, 3) }
    let(:first_company) { companies.first }
    subject { get '/api/v1/companies' }

    before do
      allow(Redis.current).to receive(:get).with('companies').and_return(nil)
      allow(Redis.current).to receive(:set).with('companies', anything, ex: Api::V1::CompaniesController::EXPIRATION_TIME)
    end

    it '200が返されること' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it '企業情報一覧が取得できること' do
      subject
      json_response = response.parsed_body
      expect(json_response.size).to eq(companies.size)
      expect(json_response[0]['id']).to eq(first_company.id)
      expect(json_response[0]['hash_id']).to eq(first_company.hash_id)
      expect(json_response[0]['name']).to eq(first_company.name)
      expect(json_response[0]['description']).to eq(first_company.description)
      expect(json_response[0]['address']).to eq(first_company.address)
      expect(json_response[0]['average_salary']).to eq(first_company.average_salary)
      expect(json_response[0]['initial_salary']).to eq(first_company.initial_salary)
      expect(json_response[0]['average_age']).to eq(first_company.average_age)
      expect(json_response[0]['employees']).to eq(first_company.employees)
      expect(json_response[0]['recruit_url']).to eq(first_company.recruit_url)
    end
  end
end
