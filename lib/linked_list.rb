require_relative 'node.rb'

class LinkedList

  attr_accessor :root

  def initialize(root = nil)
    self.root = root
  end

  def append(value)
    if self.root.nil?
      self.prepend(value)
    else
      tmp = self.root
      until tmp.next_node.nil?
        tmp = tmp.next_node
      end
      tmp.next_node = Node.new(value)
    end
  end

  def prepend(value)
    self.root.nil? ? self.root = Node.new(value) : self.root = Node.new(value, self.root)
  end

  def size
    return 0 if self.root.nil?
    count = 1
    temp = self.root
    until temp.next_node.nil?
      temp = temp.next_node
      count += 1
    end
    count
  end

  def head
    return if self.root.nil?
    temp = self.root
    return Node.new(temp.value).value
  end

  def tail
    return if self.root.nil?
    temp = self.root
    until temp.next_node.nil?
      temp = temp.next_node
    end
    temp.value
  end

  def at(index)
    temp = self.root
    until temp.next_node.nil?
      return temp.value if self.find(temp.value) == index
      temp = temp.next_node
    end
  end

  def pop
    key = self.tail
    return if self.root.nil?
    self.root = self.root.next_node if self.root.value == key
    current = self.root
    while !current.nil? && current.value != key
      previous = current
      current = current.next_node
    end
    current.nil? ? return : previous.next_node = current.next_node
  end

  def contains?(value)
    temp = self.root
    until temp.nil?
      return true if temp.value == value
      temp = temp.next_node
    end
    false
  end

  def find(value)
    return 0 if self.root.value == value
    idx_count = 0
    temp = self.root
    until temp.next_node.nil?
      temp = temp.next_node
      idx_count += 1
      return idx_count if temp.value == value
    end
  end

  def to_s
    return '' if self.root.nil?
    temp = self.root
    str_ver = ''
    while !temp.next_node.nil?
      str_ver += %(( #{temp.value} ) -> )
      temp = temp.next_node
    end
    str_ver += %(( #{temp.value} ) -> )
  end

  # TODO: implement the #insert_at and #remove_at method for extra credit
  def insert_at(value, index)
    self.prepend(value) if index == 0
    count = 0
    curr = self.root
    while !curr.nil?
      prev = curr
      curr = curr.next_node
      count += 1
      if count == index
        to_insert = Node.new(value, curr)
        prev.next_node = to_insert
      end
    end
  end

  def remove_at(index)
    self.root = self.root.next_node if index == 0
    count = 0
    current = self.root
    while !current.nil?
      prev = current
      current = current.next_node
      count += 1
      return prev.next_node = current.next_node if count == index
    end
  end
end
