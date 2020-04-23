require 'nokogiri'
require 'open-uri'
require 'openssl'

employers = ['wm', 'acme', 'fiveguys', 'tacobell']
pages_with_default_content = Hash.new {|hash, key| hash[key] = [] }

employers.each do |employer|
  url = "https://#{employer}.defaultale.guildacceptance.com/partner?auth_redirect=true"
  doc = Nokogiri::HTML(URI.open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  doc.traverse do |node|
    if node.text? && node.text.include?('   ')
      pages_with_default_content[employer] << node.text.gsub('   ', '')
    end
  end
end

error_results_message = pages_with_default_content.map do |employer, content|
  "*#{employer.upcase}'s* partner page is displaying the following pieces of default content: #{content.map(&:strip).map.with_index {|content, i| "\n\t_" + (i+1).to_s + ". " + content + "_"}.join}"
end.join("\n\n")

if pages_with_default_content.count > 0
  puts ":alert: *Warning:* Default content found for #{pages_with_default_content.count} partner(s).\n#{error_results_message}"
end