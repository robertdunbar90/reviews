base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'

xml.tag! 'urlset', "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "#{base_url}"
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  @items.each do |item|
    xml.url do
      xml.loc item_url(item)
      xml.lastmod item.updated_at.to_date
      xml.changefreq "always"
      xml.priority 0.9
    end
  end
end
