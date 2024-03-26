class Api::V1::CompaniesController < Api::ApplicationController
  def index
    companies = Company.all
    render json: companies, each_serializer: CompanySerializer
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
    return if query.blank?

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
      # when 'job_offers' then array << { job_offers: [job_offer_technologies: [:technology]] }
      when 'job_offers' then array << :job_offers
      when 'interns' then array << :interns
      end
    end
  end
end
