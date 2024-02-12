require 'metainspector'

class OgpFetcher
  def self.fetch(url)
    return unless url.present?
    page = MetaInspector.new(url)
    title = page.title
    description = page.description
    url = page.url
    image_url = page.meta['og:image']
    favicon_url = page.images.favicon

    { title: title,
      description: description,
      url: url,
      image_url: image_url,
      favicon_url: favicon_url
    }
  rescue StandardError => e
    return e.message
  end
end
