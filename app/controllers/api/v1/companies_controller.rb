class Api::V1::CompaniesController < Api::ApplicationController
  # 期限を設定
  EXPIRATION_TIME = 86400 # 1日の秒数

  def index
    serialized_companies = fetch_companies
    render json: serialized_companies
  end

  def show
    options = params[:options] || []
  
    includes_array = []
    includes_array << :company_services if options.include?('company_services')
    includes_array << :company_benefits if options.include?('company_benefits')
    includes_array << :company_abouts if options.include?('company_abouts')
    includes_array << { job_offers: [job_offer_technologies: [:technology]] } if options.include?('job_offers')
    includes_array << { company_articles: [:article] } if options.include?('company_articles')
    includes_array << :interns if options.include?('interns')
  
    company = Company.includes(includes_array).find_by(hash_id: params[:id])
    
    return render json: { error: '企業が見つかりませんでした' }, status: :not_found if company.nil?

    render json: company, serializer: CompanySerializer, scope: options, scope_name: :options
  end

  def search
    query = params[:query]
    compannies = Company.where('name LIKE ?', "%#{query}%")
    render json: compannies, each_serializer: CompanySerializer
  end

  private

  def fetch_companies
    # Rails.chache.fetchが使えないため、Redis.currentで代用
    cached_data = Redis.current.get('companies')

    return cached_data unless cached_data.nil?

    # キャッシュにデータがない場合、データベースからデータを取得し、シリアライズしてRedisに保存
    companies = Company.all
    serialize_and_cache_companies(companies)
  end

  def serialize_and_cache_companies(companies)
    serialized_companies = ActiveModelSerializers::SerializableResource.new(companies, each_serializer: CompanySerializer).to_json
    Redis.current.set('companies', serialized_companies, ex: EXPIRATION_TIME)
    
    serialized_companies
  end
end
