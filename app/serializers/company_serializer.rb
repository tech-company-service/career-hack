class CompanySerializer < ApplicationSerializer
  attributes :id, :hash_id, :name, :description, :address, :average_salary, :initial_salary, :average_age, :employees, :recruit_url

  has_many :articles, serializer: ArticleSerializer, if: -> { render?('company_articles') }
  has_many :company_services, serializer: CompanyServiceSerializer, if: -> { render?('company_services') }
  has_many :job_offers, serializer: JobOfferSerializer, if: -> { render?('job_offers') }
  has_many :interns, serializer: InternSerializer, if: -> { render?('interns') }
  has_many :company_benefits, serializer: CompanyBenefitSerializer, if: -> { render?('company_benefits') }
end