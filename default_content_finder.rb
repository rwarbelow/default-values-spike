require 'nokogiri'
require 'open-uri'
require 'openssl'

employers = ['wm', 'chipotle', 'fiveguys', 'tacobell']
pages_with_default_content = Hash.new {|hash, key| hash[key] = [] }

employers.each do |employer|
  url = "https://#{employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
  doc = Nokogiri::HTML(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  doc.traverse do |node|
    if node.text? && node.to_html(encoding:'US-ASCII').include?('&#8204;')
      puts "Found default content for #{employer}: #{node.text}"
      pages_with_default_content[employer] << node.text
    end
  end
end

p pages_with_default_content