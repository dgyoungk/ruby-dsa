require_relative 'hash_map.rb'

testing = HashMap.new

value = 'Johnny'

key1 = testing.hash(value)
testing.set(key1, value)

value = 'Mike'
key2 = testing.hash(value)
testing.set(key2, value)

# p testing.hash_table

# p testing.remove(key1)

# p testing.hash_table

p testing.hash_table.empty?
p testing.length
