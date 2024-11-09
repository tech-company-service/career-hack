class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by!(hash_id: params[:hash_id])
  end
end
