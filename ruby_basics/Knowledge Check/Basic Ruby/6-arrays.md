### What is an array and why is it useful?

Arrays allow us to store a collection of data into a single object that we can reference using indexes which are performant and space efficient.

### What are two ways to create a new empty array?

```variable = []
variable = Array.new()
```

### What are some ways of accessing the elements in an array?

By calling the index directly: `variable[index]`.
By using a helper method, such as `array.first` / `array.last`.

### What are 3 ways to add data to an array?

```
variable << new_value
variable.push(5) ← at end of an array
variable.shift ← start of an array
```

### How can you remove elements from an array?

You can `.pop`, `.unshift`, or `.clear` amongst others.
