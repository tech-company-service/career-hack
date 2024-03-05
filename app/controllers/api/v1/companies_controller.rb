class Api::V1::CompaniesController < Api::ApplicationController
  # 期限を設定
  # 1日の秒数
  EXPIRATION_TIME = 86_400

  def index
    serialized_companies = fetch_companies
    render json: serialized_companies
  end

  def show
    options = params[:options] || []
    options_array = build_options_array(options)
    company = Company.includes(options_array).find_by(hash_id: params[:hash_id])
    
    return render json: { error: '企業が見つかりませんでした' }, status: :not_found if company.nil?

    render json: company, serializer: CompanySerializer, scope: options, scope_name: :options
  end

  def search
    query = params[:query]
    compannies = Company.where('name LIKE ?', "%#{query}%")
    render json: compannies, each_serializer: CompanySerializer
  end

  private

  def build_options_array(options)
    options.each_with_object([:company_projects]) do |option, array|
      case option
      when 'company_services' then array << :company_services
      when 'company_benefits' then array << :company_benefits
      when 'company_articles' then array << :company_articles
      when 'company_abouts' then array << :company_abouts
      when 'job_offers' then array << { job_offers: [job_offer_technologies: [:technology]] }
      when 'interns' then array << :interns
      end
    end
  end

  def fetch_companies
    # Rails.chache.fetchが使えないため、Redis.currentで代用
    # 警告文要リファクタ対象
    cached_data = Redis.current.get('companies')

    return cached_data unless cached_data.nil?

    companies = Company.includes(:company_projects).all
    serialize_companies(companies)
  end

  def serialize_companies(companies)
    serialized_companies = ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    cache_companies(serialized_companies)
    serialized_companies
  end

  def cache_companies(serialized_companies)
    Redis.current.set('companies', serialized_companies, ex: EXPIRATION_TIME)
  end
end
