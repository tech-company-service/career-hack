class Api::V1::CompaniesController < Api::ApplicationController
  def index
    # 現状、redisへのキャッシュはできていない
    # res_companies = Rails.cache.fetch("companies", expires_in: 1.day) do
    #   companies = Company.all
    #   ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    # end
    # render json: res_companies

    companies = Company.all
    render json: companies, each_serializer: CompanySerializer
  end

  def show
    options = params[:options] || []
  
    includes_array = []
    includes_array << :company_services if options.include?('company_services')
    includes_array << :company_benefits if options.include?('company_benefits')
    includes_array << { job_offers: [job_offer_technologies: [:technology]] } if options.include?('job_offers')
    includes_array << { company_articles: [:article] } if options.include?('company_articles')
    includes_array << :interns if options.include?('interns')
  
    company = Company.includes(includes_array).find_by(hash_id: params[:id])
    
    return render json: { error: 'Company not found' }, status: :not_found if company.nil?

    render json: company, serializer: CompanySerializer, scope: options, scope_name: :options
  end

  def search
    query = params[:query]
    compannies = Company.where('name LIKE ?', "%#{query}%")
    render json: compannies, each_serializer: CompanySerializer
  end
end
