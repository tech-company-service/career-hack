require 'rails_helper'

RSpec.describe 'Api::V1::CompaniesController', type: :request do
  describe 'GET /api/v1/companies' do
    let!(:companies) { create_list(:company, 3) }
    let(:first_company) { companies.first }
    let(:second_company) { companies.second }
    let(:third_company) { companies.third }

    subject { get '/api/v1/companies' }

    before do
      allow(Redis.current).to receive(:get).with('companies').and_return(nil)
      allow(Redis.current).to receive(:set).with('companies', anything, ex: Api::V1::CompaniesController::EXPIRATION_TIME)
    end

    it '200が返されること' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'DBに存在する企業数と同じ数のjsonデータが存在すること' do
      subject
      json_response = response.parsed_body
      expect(json_response.size).to eq(companies.size)
    end

    it '企業一覧のjsonデータが取得できること' do
      subject
      json_response = response.parsed_body

      expect(json_response[0]['id']).to eq(first_company.id)
      expect(json_response[0]['hash_id']).to eq(first_company.hash_id)
      expect(json_response[0]['name']).to eq(first_company.name)

      expect(json_response[1]['id']).to eq(second_company.id)
      expect(json_response[1]['hash_id']).to eq(second_company.hash_id)
      expect(json_response[1]['name']).to eq(second_company.name)

      expect(json_response[2]['id']).to eq(third_company.id)
      expect(json_response[2]['hash_id']).to eq(third_company.hash_id)
      expect(json_response[2]['name']).to eq(third_company.name)
    end
  end
end
