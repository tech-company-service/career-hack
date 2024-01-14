class CompanySerializer < ActiveModel::Serializer
  attributes :id, :hash_id, :name, :description, :address, :average_salary, :initial_salary, :average_age, :employees, :recruit_url

  has_many :articles, serializer: ArticleSerializer
  has_many :company_services, serializer: CompanyServiceSerializer
  has_many :job_offers, serializer: JobOfferSerializer
end