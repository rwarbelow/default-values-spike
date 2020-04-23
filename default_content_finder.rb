require 'nokogiri'
require 'open-uri'
require 'openssl'

employers = ['wm', 'chipotle', 'fiveguys', 'tacobell']
pages_with_default_content = Hash.new {|hash, key| hash[key] = [] }

employers.each do |employer|
  url = "https://#{employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
  doc = Nokogiri::HTML(URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  doc.traverse do |node|
    if node.text? && node.to_html(encoding:'US-ASCII').include?('&#8204;')
      pages_with_default_content[employer] << node.to_html(encoding:'US-ASCII').gsub('&#8204;', '')
    end
  end
end

error_results_message = pages_with_default_content.map do |employer, content|
  "\t-- On #{employer} subdomain, found '#{content.map(&:strip).join(", ")}'"
end.join("\n")

if pages_with_default_content.count > 0
  "Warning: Default content found!\n#{error_results_message}"
end