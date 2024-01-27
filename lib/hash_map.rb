require_relative 'linked_list.rb'
require_relative 'node.rb'
# This will be an array of Linked Lists essentially
# hash function outputs the array key, that key modulus capacity wil be used as an index to the table array
# then prepend a Node created from the key and the value to the list
# so the Node class needs to have a key and a value attribute

class HashMap
  attr_accessor :hash_table
  attr_reader :capacity, :load_factor

  def initialize()
    @capacity = 16
    @load_factor = 0.75
    self.hash_table = Array.new(@capacity)
  end

  def capacity
    @capacity
  end

  def load_factor
    @load_factor
  end

  # cited from TOP lesson
  def hash(string)
    code = 0
    prime_number = 31
    string.each_char { |char| code = prime_number * code + char.ord }
    code
  end

  def set(key, value)
    idx = key % capacity
    raise IndexError if idx.negative? || idx >= capacity
    hash_table[idx] = LinkedList.new if hash_table[idx].nil?
    hash_table[idx].prepend(key, value)
    # add in a clause for growing the table if the current capacity >= load_factor
    # double the array size if the array is 3/4 full (12 out of 16 occupied)
  end

  def get(key)
    idx = key % capacity
    raise IndexError if idx.negative? || idx >= capacity
    return if hash_table[idx].nil?
    head = hash_table[idx].root
    until head.nil?
      return head.value if hash(head.value) == key
      head = head.next_node
    end
  end

  def key?(key)
    idx = key % capacity
    raise IndexError if idx.negative? || idx >= capacity
    return false if hash_table[idx].nil?
    head = hash_table[idx].root
    until head.nil?
      return true if hash(head.value) == key
    end
    false
  end

  def remove(key)
    idx = key % capacity
    raise IndexError if idx.negative? || idx >= capacity
    return if hash_table[idx].nil?
    curr = hash_table[idx].root
    if hash(curr.value) == key
      hash_table[idx].root = hash_table[idx].root.next_node
      return curr.value
    end
    while !curr.nil? && hash(curr.value) != key
      previous = curr
      curr = curr.next_node
    end
    curr.nil? ? return : previous.next_node = curr.next_node
    curr.value
  end

  def length
    return 0 if hash_table.empty?
    count = hash_table.reduce(0) do |sum, bucket|
      unless bucket.nil?
        list = bucket.root
        until list.nil?
          sum += 1
          list = list.next_node
        end
      end
      sum
    end
  end

  def clear
    hash_table.map! { |bucket| bucket = nil }
  end

  # methods that return an array
  def keys
    return [] if hash_table.empty?
    keys = hash_table.reduce([]) do |arr, bucket|
      unless bucket.nil?
        nodes = bucket.root
        until nodes.nil?
          arr << nodes.key
          nodes = nodes.next_node
        end
      end
      arr
    end
  end

  def values
    return [] if hash_table.empty?
    values = hash_table.reduce([]) do |arr, bucket|
      unless bucket.nil?
        nodes = bucket.root
        until nodes.nil?
          arr << nodes.value
          nodes = nodes.next_node
        end
      end
      arr
    end
  end

  def entries
    return [[]] if hash_table.empty?
    hash_table.reduce([]) do |arr2d, bucket|
      unless bucket.nil?
        list = bucket.root
        until list.nil?
          arr2d << [list.key, list.value]
          list = list.next_node
        end
      end
      arr2d
    end
  end
end
