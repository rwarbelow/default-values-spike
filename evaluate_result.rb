puts "Here is the ENV result:"
puts "#{ENV['RESULT']}"

if ENV["RESULT"].length > 1
  exit 1
else
  puts "Good to go!"
end