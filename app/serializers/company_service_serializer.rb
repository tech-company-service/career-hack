class CompanyServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :launched_at
end
