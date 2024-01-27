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
    table_index = key % capacity
    raise IndexError if table_index.negative? || table_index >= capacity
    hash_table[table_index] = LinkedList.new if hash_table[table_index].nil?
    hash_table[table_index].prepend(value, key)
    # add in a clause for growing the table if the current capacity >= load_factor
    # double the array size if the array is 3/4 full (12 out of 16 occupied)
  end

  def get(key)
    table_index = key % capacity
    raise IndexError if table_index.negative? || table_index >= capacity
    return if hash_table[table_index].nil?
    head = hash_table[table_index].root
    until head.nil?
      return head.value if hash(head.value) == key
      head = head.next_node
    end
  end

  def key?(key)
    table_index = key % capacity
    raise IndexError if table_index.negative? || table_index >= capacity
    return false if hash_table[table_index].nil?
    head = hash_table[table_index].root
    until head.nil?
      return true if hash(head.value) == key
    end
    false
  end

  def remove(key)
    table_index = key % capacity
    raise IndexError if table_index.negative? || table_index >= capacity
    return if hash_table[table_index].nil?
    curr = hash_table[table_index].root
    if hash(curr.value) == key
      hash_table[table_index].root = hash_table[table_index].root.next_node
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
    count = hash_table.each.with_object(0) do |bucket, keys|
      next if bucket.nil?
      current = bucket.root
      until current.nil?
        current = current.next_node
        keys += 1
      end
      keys
    end
  end

  def clear
  end

  # methods that return an array
  def keys
  end

  def values
  end

  def entries
  end

end
