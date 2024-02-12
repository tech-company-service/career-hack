require 'metainspector'

class OgpFetcher
  def self.fetch(url)
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
end
