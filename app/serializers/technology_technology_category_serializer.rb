class TechnologyTechnologyCategorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :technology, serializer: TechnologySerializer
  belongs_to :technology_category, serializer: TechnologyCategorySerializer
end
