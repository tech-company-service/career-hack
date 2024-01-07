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
end