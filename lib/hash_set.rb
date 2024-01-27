# a Set of LinkedList objects
# no values, only keys
require_relative 'linked_list.rb'
require_relative 'node.rb'

class HashSet
  attr_accessor :h_set
  attr_reader :capacity, :load_factor

  def initialize
    @capacity = 16
    @load_factor = 0.75
    self.h_set = Array.new(capacity)
  end

  def capacity
    @capacity
  end

  def load_factor
    @load_factor
  end

  def hash(string)
    code = 0
    prime_number = 31
    string.each_char { |char| code = prime_number * code + char.ord }
    code
  end

  def set(key)
    map_index = key % capacity
    raise IndexError if map_index.negative? || map_index >= capacity
    h_set[map_index] = LinkedList.new if h_set[map_index].nil?
    h_set[map_index].prepend(key)
  end

  def get(key)
    map_index = key % capacity
    raise IndexError if map_index.negative? || map_index >= capacity
    return if h_set[map_index].nil?
    nodes = h_set[map_index].root
    until nodes.nil?
      return nodes.key if nodes.key == key
      nodes = nodes.next_node
    end
  end

  def key?(key)
    map_index = key % capacity
    raise IndexError if map_index.negative? || map_index >= capacity
    return false if h_set[map_index].nil?
    nodes = h_set[map_index].root
    until nodes.nil?
      return true if nodes.key == key
    end
    return false
  end

  def remove(key)
    map_index = key % capacity
    raise IndexError if map_index.negative? || map_index >= capacity
    return if h_set[map_index].nil?
    nodes = h_set[map_index].root
    if nodes.key == key
      h_set[map_index].root = h_set[map_index].root.next_node
      return nodes.key
    end
    while !nodes.nil? && nodes.key != key
      prev = nodes
      nodes = nodes.next_node
    end
    nodes.nil? ? return : prev.next_node = nodes.next_node
    nodes.key
  end

  def length
    return 0 if h_set.empty?
    count = h_set.reduce(0) do |total, bucket|
      unless bucket.nil?
        list = bucket.root
        until list.nil?
          total += 1
          list = list.next_node
        end
      end
      total
    end
  end

  def clear
    h_set.map! { |bucket| bucket = nil }
  end

  def keys
    return [] if h_set.empty?
    key_arr = h_set.reduce([]) do |arr, bucket|
      unless bucket.nil?
        list = bucket.root
        until list.nil?
          arr.push(list.key)
          list = list.next_node
        end
      end
      arr
    end
  end
end

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
