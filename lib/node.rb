class Node
  attr_reader :key
  attr_accessor :next_node, :value

  def initialize(key = nil, value = nil, next_node = nil)
    @key = key
    @value = value
    self.next_node = next_node
  end
end
