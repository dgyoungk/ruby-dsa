class Node
  attr_reader :key
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil, key = nil)
    @value = value
    self.next_node = next_node
    @key = key
  end
end
