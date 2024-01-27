require_relative 'hash_map.rb'

testing = HashMap.new

names = %w(Johnny Mike George Rachel Billy Dan Thea Chandler Remus Ronald Johnson Dave Chris Tommy)
names.each do |name|
  key = testing.hash(name)
  testing.set(key, name)
end

puts %(Hash Map Method Demonstration:)
puts %(String representation of the Hash Map (using LinkedList's #to_s))
puts testing.hash_table

puts %(\n#get(key): returns the value associated with key; returns nil if not found)
puts %(Key: hashed from value 'Johnny')
puts testing.get(testing.hash(names[0]))

puts %(\n#key?(key): returns boolean value indicating whether key exists in Hash Map)
puts %(Key: hashed from value 'Mike')
p testing.key?(testing.hash(names[1]))

puts %(#remove(key): removes the key, value pair at the given key and returns the value)
puts %(returns nil if the key is not found in the Hash Map)
puts %(Key: hashed from value 'Rachel')
p testing.remove(testing.hash(names[3]))

puts %(\nThe updated Hash Map after #remove method:)
puts testing.hash_table
puts %(\n#set(key, value): insert a new Node into the Hash Map)
testing.set(testing.hash(names[3]), names[3])
puts %(\nThe Hash Map after inserting Rachel back)
puts testing.hash_table

puts %(\n#length: displays the number of stored keys)
p testing.length
puts %(\n#keys: returns an array of stored keys)
p testing.keys
puts %(\n#values: returns an array of stored values)
p testing.values
puts %(\n#entries: returns a 2D array of key, value pairs)
p testing.entries

puts %(\n#clear: clears the Hash Map)
testing.clear
puts %(Updated Hash Map:)
puts testing.hash_table
