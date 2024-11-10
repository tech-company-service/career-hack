class CompaniesController < ApplicationController
  def index
    @companies = Company.preload(:company_projects).all
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
