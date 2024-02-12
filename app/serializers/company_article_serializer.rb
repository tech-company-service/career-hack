class CompanyArticleSerializer < ApplicationSerializer
  attributes :id, :title, :description, :url, :ogp_image_url
end
