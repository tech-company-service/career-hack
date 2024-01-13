class Api::V1::ArticlesController < ApplicationController
  def index
    # 現状、redisへのキャッシュはできていない
    res_articles = Rails.cache.fetch("articles", expires_in: 1.day) do
      articles = Article.all
      ActiveModelSerializers::SerializableResource.new(articles, each_serializer: ArticleSerializer).to_json
    end
    render json: res_articles
  end
end
