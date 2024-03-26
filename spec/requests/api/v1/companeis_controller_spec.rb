require 'rails_helper'

RSpec.describe 'Api::V1::CompaniesController', type: :request do
  describe 'GET /api/v1/companies' do
    let!(:companies) { create_list(:company, 3) }
    let(:first_company) { companies.first }
    let(:second_company) { companies.second }
    let(:third_company) { companies.third }

    subject { get '/api/v1/companies' }

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

  describe 'GET /api/v1/companies/[hash_id]' do
    let!(:company) { create(:company) }
    let!(:company_service) { create(:company_service, company:) }
    let!(:company_benefit) { create(:company_benefit, company:) }
    let!(:company_article) { create(:company_article, company:) }
    let!(:company_about) { create(:company_about, company:) }
    let!(:job_offer) { create(:job_offer, company:) }
    let!(:intern) { create(:intern, company:) }

    subject { get "/api/v1/companies/#{hash_id}", params: }

    context '企業が存在する場合' do
      let(:hash_id) { company.hash_id }
      let(:params) { { options: %w[company_services company_benefits company_articles company_abouts job_offers interns] } }

      it '200が返されること' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it '企業と関連するjsonデータが取得できること' do
        subject
        json_response = response.parsed_body
        expect(json_response['id']).to eq(company.id)
        expect(json_response['hash_id']).to eq(company.hash_id)
        expect(json_response['name']).to eq(company.name)

        # company_services
        expect(json_response['company_services'][0]['id']).to eq(company_service.id)
        expect(json_response['company_services'][0]['name']).to eq(company_service.name)
        expect(json_response['company_services'][0]['description']).to eq(company_service.description)
        expect(json_response['company_services'][0]['launched_at']).to eq(company_service.launched_at)

        # company_benefits
        expect(json_response['company_benefits'][0]['id']).to eq(company_benefit.id)
        expect(json_response['company_benefits'][0]['title']).to eq(company_benefit.title)
        expect(json_response['company_benefits'][0]['content']).to eq(company_benefit.content)

        # company_articles
        expect(json_response['company_articles'][0]['id']).to eq(company_article.id)
        expect(json_response['company_articles'][0]['title']).to eq(company_article.title)
        expect(json_response['company_articles'][0]['description']).to eq(company_article.description)
        expect(json_response['company_articles'][0]['url']).to eq(company_article.url)
        expect(json_response['company_articles'][0]['ogp_image_url']).to eq(company_article.ogp_image_url)

        # company_abouts
        expect(json_response['company_abouts'][0]['id']).to eq(company_about.id)
        expect(json_response['company_abouts'][0]['title']).to eq(company_about.title)
        expect(json_response['company_abouts'][0]['content']).to eq(company_about.content)

        # job_offers
        expect(json_response['job_offers'][0]['id']).to eq(job_offer.id)
        expect(json_response['job_offers'][0]['name']).to eq(job_offer.name)
        expect(json_response['job_offers'][0]['description']).to eq(job_offer.description)

        # interns
        expect(json_response['interns'][0]['intern_id']).to eq(intern.id)
        expect(json_response['interns'][0]['title']).to eq(intern.title)
        expect(json_response['interns'][0]['description']).to eq(intern.description)
        expect(json_response['interns'][0]['link']).to eq(intern.link)
        # entry_deadline_date, started_at, ended_at, periodは、精度を合わせないといけないため保留
        expect(json_response['interns'][0]['site']).to eq(intern.site)
        expect(json_response['interns'][0]['style_type']).to eq(I18n.t("enums.intern.style_type.#{intern.style_type}"))
        expect(json_response['interns'][0]['recruitment_type']).to eq(I18n.t("enums.intern.recruitment_type.#{intern.recruitment_type}"))
      end
    end

    context '企業が存在しない場合' do
      let(:hash_id) { 'invalid_hash_id' }
      let(:params) { { options: [] } }

      it '404が返されること' do
        subject
        expect(response).to have_http_status(:not_found)
      end

      it 'エラーメッセージが返されること' do
        subject
        json_response = response.parsed_body
        expect(json_response['error']).to eq('企業が見つかりませんでした')
      end
    end
  end
end
