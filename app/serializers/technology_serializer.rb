class TechnologySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_type
end
