class CompanySerializer < ActiveModel::Serializer
  attributes :id, :hash_id, :name, :description, :address, :average_salary, :initial_salary, :average_age, :employees, :recruit_url, :technologies, :technology_categories

  has_many :articles, serializer: ArticleSerializer

  has_many :company_services, serializer: CompanyServiceSerializer

  def technologies
    object.technology_technology_categories.map(&:technology).uniq
  end

  def technology_categories
    object.technology_technology_categories.map(&:technology_category).uniq
  end
end