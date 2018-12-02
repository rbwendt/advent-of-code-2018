d = File.read('data/day1.txt')
puts "a:"
puts eval( d.gsub("\n", '') )

puts "b:"

twice = nil
seen = []
sum = 0
loop do
  d.split("\n").each do |r|
    sum += r.to_i

    if seen.include?(sum)
      twice = sum
      break
    end
    seen << sum
  end
  break unless twice.nil?
end
puts twice.inspect
