class CompanyTechnologyTechnologyCategorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :technology_technology_category, serializer: TechnologyTechnologyCategorySerializer
end
