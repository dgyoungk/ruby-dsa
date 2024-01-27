require_relative 'hash_set.rb'
### HashSet Demonstration ###

nba_goats = %w(Kobe Jordan Magic Bird Scottie Dennis Stockton Payton Malone)

setter = HashSet.new

nba_goats.each do |goat|
  key = setter.hash(goat)
  setter.set(key)
end

puts %(Hash Set Method Demonstration:)
puts %(String representation of the Hash Set (using LinkedList's #to_s))
puts setter.h_set

puts %(\n#get(key): returns the key associated with key; returns nil if not found)
puts %(Key: hashed from value 'Kobe')
puts setter.get(setter.hash(nba_goats[0]))

puts %(\n#key?(key): returns boolean value indicating whether key exists in Hash Set)
puts %(Key: hashed from value 'Jordan')
p setter.key?(setter.hash(nba_goats[1]))

puts %(\n#remove(key): removes the node at the given key and returns the value)
puts %(returns nil if the key is not found in the Hash Set)
puts %(Key: hashed from value 'Bird')
p setter.remove(setter.hash(nba_goats[3]))

puts %(\nThe updated Hash Set after #remove method:)
puts setter.h_set
puts %(\n#set(key): insert a new Node into the Hash Set)
setter.set(setter.hash(nba_goats[3]))
puts %(\nThe Hash Set after inserting 'Bird' back)
puts setter.h_set

puts %(\n#length: displays the number of stored keys)
p setter.length
puts %(\n#keys: returns an array of stored keys)
p setter.keys

puts %(\n#clear: clears the Hash Set)
setter.clear
puts %(Updated Hash Set:)
p setter.h_set
