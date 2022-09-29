### How would you create your own method?

To create a method block you start with `def` and then indicate method completion with `end`.

### How would you call your new method?

With a descriptive name written in snake_case. Ideally a method should cover one concept.

### How do you pass variables to your method?

Through named parameters placed inside parens `()` after the method name. E.g. `greet(name)`.

### How do you define default parameters for your method?

You pass in a default value in the method defintion with `=`. E.g. `greet(name = "stranger")`.

### What is the difference between an explicit return and an implicit return?

Explicit uses `return`. Implicit omits the `return` keyword, instead returning the last executable line of the block.

### What is the difference between puts and return?

`puts` prints output. `return` returns a value that can be used in other methods.

### How do you chain multiple methods together?

Using dot syntax, you append methods to an object. E.g. `array.join(" ").sort`.

### Give an example of a valid method name and an invalid method name.

An example valid method name is "my_method". An invalid method name example would be "1_my_method" or "def" or "with?punctuation". Method names that are invalid use aq reserved word, or begin with a number, or use `?` `!` `=` symbols anywhere that is not the end of the method name.

### What is snake case?

Snake case splits up multiple words with an underscore `_`. There is also no capitalization in snake case.

### What are some of Ruby’s reserved words?

There are 40 or so reserved words that cannot be used in a method name. Words like `def` or `end` cannot be used as the interpreter cannot tell between a method name and language specific syntax.

### What do you call a method that returns true or false? What is their naming convention?

A predicate. These return `true` or `false` and are similar to asking a T/F question to the object – e.g. `number.even?`. The naming convention of appending a question mark `?` to the end of the method indicates to others it is a predicate. Unfortunately this is not true for all predicates.

### What do bang methods do? What is their naming convention?

You denote a bang method with the exclamation mark (`!`). Unlike normal methods, this mutates the data passed in. E.g. `array.sort` would return a new sorted array vs. `array.sort!` would sort the array passed in.
