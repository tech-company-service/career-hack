require 'csv'

namespace :task do
  desc '記事を一括投入する'
  task insert_articles: :environment do
    logger = Logger.new('log/insert_articles.log')
    company = Company.first
    CSV.foreach('lib/tasks/articles.csv', headers: true) do |row|
      article_info = fetch(row[0])
      c_article = CompanyArticle.new(
        company_id: company.id,
        title: article_info[:title],
        description: article_info[:description],
        url: article_info[:url],
        ogp_image_url: article_info[:image_url]
      )
      c_article.save!
    end
  rescue StandardError => e
    logger.error("記事の一括投入に失敗失敗しました\n#{e}")
  end
end

def fetch(url)
  return if url.blank?

  page = MetaInspector.new(url)
  title = page.title
  description = page.description
  url = page.url
  image_url = page.meta['og:image']

  { title:,
    description:,
    url:,
    image_url: }
rescue StandardError => e
  e.message
end
