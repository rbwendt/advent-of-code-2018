
twos = 0
threes = 0
File.open('data/day2.txt').each do |r|
  r = r.split('')
  x = r.reduce(Hash.new(0)) {|a, y| a[y] += 1; a}
  threes += 1 if x.values.include? 3
  twos += 1 if x.values.include? 2
end

puts 'a:'
puts twos * threes

x = File.open('data/day2.txt').map do |r|
  r.chomp.split('')
end

found = false
x.each_with_index do |a, i|
  x.each_with_index do |b, j|
    next if i == j

    bad_idx = nil
    diff = 0
    a.each_with_index do |c, k|
      if c != b[k]
        diff += 1
        bad_idx = k
      end
      break if diff == 2
    end

    if diff == 1
      puts 'b:'
      b.delete_at(bad_idx)
      puts b.join('')
      found = true
      break
    end
  end
  break if found
end
