class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    self.next_node = next_node
  end

  def value
    @value
  end


end
