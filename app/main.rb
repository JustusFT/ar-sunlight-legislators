require_relative "models/legislator.rb"

senators = Legislator.where("title = ?", "Sen")
representatives = Legislator.where("title = ?", "Rep")

#query 1
puts "Senators:"
senators.where("state = ?", "NV").order("lastname").each do |x|
  puts "  #{x.name} (#{x.party})"
end

puts "Representatives:"
representatives.where("state = ?", "NV").each do |x|
  puts "  #{x.name} (#{x.party})"
end

#query 2
puts "Male senators: #{senators.where("gender = ?", "M").count} (#{(senators.where("gender = ?", "M").count.to_f / senators.all.count * 100).round(2)}%)"
puts "Male representatives: #{representatives.where("gender = ?", "M").count} (#{(representatives.where("gender = ?", "M").count.to_f / representatives.all.count * 100).round(2)})%"
puts "Female senators: #{senators.where("gender = ?", "F").count} (#{(senators.where("gender = ?", "F").count.to_f / senators.all.count * 100).round(2)}%)"
puts "Female representatives: #{representatives.where("gender = ?", "F").count} (#{(representatives.where("gender = ?", "F").count.to_f / representatives.all.count * 100).round(2)})%"

#query 3
result = []
states = senators.distinct.pluck(:state)
states.each do |x|
  sen = senators.where("state = ?", x).count
  rep = representatives.where("state = ?", x).count
  result << ["#{x}: #{sen} Senators, #{rep} Representatives", sen + rep]
end
result.sort! do |a, b|
  b[1] <=> a[1]
end
result.map! do |x|
  x[0]
end
puts result

#query 4
puts "Senators: #{senators.count}"
puts "Representatives: #{representatives.count}"
puts Legislator.count

#delete 5
Legislator.where("in_office = ?", "0").each do |x|
  x.delete
end

puts "Senators: #{senators.count}"
puts "Representatives: #{representatives.count}"
