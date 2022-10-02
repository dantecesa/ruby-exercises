### What is a nested array? What data is useful to store in a nested array?

An array that contains another array inside it (e.g. an array index references another array object). This is useful for storing related positional data (e.g. think x-y, or a spreadsheet).

### What is a nested hash? What data is useful to store in a nested hash?

A hash that contains another hash inside it (e.g. one of the keys inside the outer hash references another hash). This is useful for storing associated data.

### How do you access elements in a nested array?

e.g. `array[x][y]` – where `y` is the index of the element we want inside element `x`.

### How do you access data in a nested hash?

e.g. `hash[:x][:y]` – where `y` is the sub-key we want inside key `x`.

### Why is the #dig method useful?

If we attempt to access a nested array or hash that doesn't exist, we get `nil` instead of a `NoMethodError` error.

### How do you add elements to a nested array?

Just like a normal array. You can use `.push` or the shovel `<<` operator one level deeper.

### How do you add data to a nested hash?

Just like a hash as well. Specify the subkey when adding the data. E.g. `hash[key][subkey]`.

### How do you delete elements from a nested array?

`array[x].pop`

### How do you delete data in a nested hash?

`hash[key].delete(:subkey)`

### How do you create a new nested array that is not mutable?

During creation you pass a block that initializes the nested array. In this way, a new object is created every time (vs. pointing all of the nested arrays to the same single initialized object).

`Array.new(3, Array.new())` ← bad b/c any change to any of the nested array values appear on all indexes of the outer array.
`Array.new(3) { Array.new() }` ← good b/c creates a unique nested array per outer array index. Changes to the inner array do not appear at other array indexes.

### How do you iterate over a nested array?

By nesting another enumeration method inside the outer enumeration.

### How do you iterate over a nested hash?

Using any of our enumerable methods (e.g. `.map`, `.select`, `.filter_map`, etc…).
