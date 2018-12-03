
d = File.readlines('data/day3.txt')

pattern = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/
multi_claim = []
all_multi_claim = []
ids = []

h = d.reduce([]) do |a, r|
  _, id, x, y, w, h = pattern.match(r).to_a

  id = id.to_i
  x = x.to_i
  y = y.to_i
  w = w.to_i - 1
  h = h.to_i - 1

  ids << id

  x.upto(x+w) do |xc|
    a[xc] ||= []
    y.upto(y+h) do |yc|
      a[xc][yc] ||= []
      a[xc][yc] << id
      multi_claim << id if a[xc][yc].count == 2
      if a[xc][yc].count > 1
        all_multi_claim = all_multi_claim | a[xc][yc]
      end
    end
  end

  a
end

puts 'a:'
puts multi_claim.count

puts 'b:'
puts (ids - all_multi_claim).inspect
