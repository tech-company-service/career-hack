class CompanyArticle < ApplicationRecord
  #
  # callbacks
  #
  # before_save :fetch_ogp_image_url

  #
  # Associations
  #
  belongs_to :company

  #
  # validations
  #
  validates :title, presence: true
  validates :url, presence: true

  private

  def fetch_ogp_image_url
    self.ogp_image_url = OgpFetcher.fetch(url)
  end
end
