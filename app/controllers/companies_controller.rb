class CompaniesController < ApplicationController
  def index
    @companies = if params[:name].present?
                   Company.preload(:company_projects).where("name LIKE ?", "%#{params[:name]}%")
                 else
                   Company.preload(:company_projects).all
                 end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @company = Company
               .preload(
                 :company_services,
                 :company_articles,
                 :job_offers,
                 :interns,
                 :company_benefits,
                 :company_abouts,
                 :company_projects
               )
               .find_by(hash_id: params[:hash_id])
  end
end
