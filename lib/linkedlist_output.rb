require_relative 'linked_list.rb'

linked_list = LinkedList.new
3.times do |n|
  linked_list.append(%(item#{n + 1}))
end
3.times do |n|
  linked_list.prepend(%(item#{(n + 2) * 2}))
end

# to_s method
puts %(The Linked List (#to_s):)
puts linked_list

# size method
puts %(\nThe List size (#size):)
puts linked_list.size

# head/tail method
puts %(\nThe head of the list (#head):)
p linked_list.head
puts %(The tail of the list (#tail):)
p linked_list.tail

# at(index) method
puts %(\nThe item value at index 3 (#at(index)):)
p linked_list.at(3)

# pop method
linked_list.pop
puts %(\nThe list after removing the last item (#pop))
puts linked_list

# contains? method
puts %(\nChecks whether item5 is in the list (#contains?(value)):)
p linked_list.contains?('item5')

# find(index) method
puts %(\nDisplays the index of list item (item4), if not found returns nil (#find(value)):)
p linked_list.find('item4')
puts %(\nDisplays the index of list item (item5), if not found returns nil:)
p linked_list.find('item5')

# insert_at(value, index)
puts %(\nThe List after inserting item10 at index 5 (#insert_at(value, index)):)
linked_list.insert_at('item10', 5)
puts linked_list
puts %(The List after inserting item3 at index 2:)
linked_list.insert_at('item3', 2)
puts linked_list

# remove_at(index)
puts %(\nThe List after removing an item at index 2 (#remove_at(index)):)
linked_list.remove_at(2)
puts linked_list
puts %(The List after removing an item at index 5:)
linked_list.remove_at(5)
puts linked_list
