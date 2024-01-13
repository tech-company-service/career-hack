class CompanySerializer < ActiveModel::Serializer
  attribute :id
  attribute :hash_id
  attribute :name
  attribute :description
  attribute :address
  attribute :average_salary
  attribute :initial_salary
  attribute :average_age
  attribute :employees
  attribute :recruit_url
  attribute :technologies
  attribute :technology_categories

  def technologies
    object.technology_technology_categories.map(&:technology).uniq
  end

  def technology_categories
    object.technology_technology_categories.map(&:technology_category).uniq
  end
end