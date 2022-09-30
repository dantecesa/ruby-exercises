### Why is there a question mark after some method names?

A `?` indicates that the method is a predicate and will return `true` or `false` after being asked a T/F question. The `?` syntax is up to the method creator, and therefore not exhaustive (i.e. unfortunately not all predicates contain the `?` postfix).

### What does the #include? method do?

Evaluates if an item exists with in an enumerable collection.

### What does the #any? method do?

Evaluates a block against an enumerable collection and returns `true` if at least one item returns `true`.

### What does the #all? method do?

Evaluates a block against an enumerable collection and returns `true` if all items returns `true`.

### What does the #none? method do?

Evaluates a block against an enumerable collection and returns `true` if every item in the collection returns `false`.
