class ArticleSerializer < ApplicationSerializer
  attributes :id, :title, :description, :link, :published_at

  has_many :companies, serializer: CompanySerializer
end
