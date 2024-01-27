require_relative 'hash_map.rb'

hashis_map = HashMap.new

names = %w(Johnny Mike George Rachel Billy Dan Thea Chandler Remus Ronald Johnson Dave Chris Tommy)
names.each do |name|
  key = hashis_map.hash(name)
  hashis_map.set(key, name)
end

puts %(Hash Map Method Demonstration:)
puts %(String representation of the Hash Map (using LinkedList's #to_s))
puts hashis_map.hash_table

puts %(\n#get(key): returns the value associated with key; returns nil if not found)
puts %(Key: hashed from value 'Johnny')
puts hashis_map.get(hashis_map.hash(names[0]))

puts %(\n#key?(key): returns boolean value indicating whether key exists in Hash Map)
puts %(Key: hashed from value 'Mike')
p hashis_map.key?(hashis_map.hash(names[1]))

puts %(#remove(key): removes the key, value pair at the given key and returns the value)
puts %(returns nil if the key is not found in the Hash Map)
puts %(Key: hashed from value 'Rachel')
p hashis_map.remove(hashis_map.hash(names[3]))

puts %(\nThe updated Hash Map after #remove method:)
puts hashis_map.hash_table
puts %(\n#set(key, value): insert a new Node into the Hash Map)
hashis_map.set(hashis_map.hash(names[3]), names[3])
puts %(\nThe Hash Map after inserting Rachel back)
puts hashis_map.hash_table

puts %(\n#length: displays the number of stored keys)
p hashis_map.length
puts %(\n#keys: returns an array of stored keys)
p hashis_map.keys
puts %(\n#values: returns an array of stored values)
p hashis_map.values
puts %(\n#entries: returns a 2D array of key, value pairs)
p hashis_map.entries

puts %(\n#clear: clears the Hash Map)
hashis_map.clear
puts %(Updated Hash Map:)
puts hashis_map.hash_table
