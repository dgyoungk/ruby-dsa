# TOP FS Ruby DSA Projects

## Linked List

### Classes:
    - LinkedList: outlines the linked list object blueprint
    - Node: the outline for each element to be placed in the linked list

### Methods:
    - #append: adds a new Node object to the end of the list
    - #prepend: adds a new Node object to the start of the list
    - #size: returns the number of Node objects in a list
    - #head: returns the first Node object in the list
    - #tail: returns the last Node object in the list
    - #at(index): returns the Node object at the given index
    - #pop: removes the last element from the list
    - #contains?(value): returns a boolean value indicating whether value exists in the list
    - #find(value): returns the index of the value in the list if it exists, otherwise returns nil
    - #to_s: returns the LinkedList object as a string
        - format: ( value ) -> ( value ) -> ( value ) -> nil
### Additional methods:
    - #insert_at(value, index): inserts a Node with value at given index
    - #remove_at(index): removes the Node specified at the index


## Hash Map

### Methods
    - #hash: produces a hash code from a given value
    - #set(key, value): insert value assigned to key at position key;
        if value already exists, overwrite
    - #get(key): returns the value assigned to key;
        returns nil if key is not found
    - #key?(key): returns a boolean value depending on whether the given key exists or not
    - #remove(key): remove the key-pair value with given key and return deleted pair's value;
        if key is not found, return nil
    - #length: returns the number of stored keys in the hash map
    - #clear: removes all entries in the hash map
    - #keys: returns an array of all the keys in the hash map
    - #values: returns an array of all values in the hash map
    - #entries: returns an array that contains each key, value pair
        e.g. [[f_key, f_value], [s_key, s_value], [t_key, t_value]]


Author: Daniel Kwon 2024
*** #hash method cited from TOP's HashMap lesson ***