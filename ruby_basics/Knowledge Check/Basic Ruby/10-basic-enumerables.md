### What does the #each method do? What does it return?

Enumerates over the input running a provided code block. It returns the original array that was provided.

### What does the #each_with_index method do?

Same as `.each` but includes an index as a block variable that you can reference.

### What does the #map method do?

Same as `.each` except the return of each block is added to an array that's returned to you. Original input remains untouched. This could be acheived with `.each` if an external variable is present.

### What does the #select method do?

Similar to `.map` but returns an array where the block returns `true`. This could be acheived in a map with an `if` or `ternary` within, but with select (also known as `filter`) it's much cleaner.

### What does the #reduce method do?

Takes an enumerable object and returns a single value. Does so by using an accumulator block variable (which persists through block runs).

### When should you use do...end around a code block versus {...}?

You should use `do...end` when your block is more than one line. This is done for readability, but has no functional difference.

### Why should you avoid using the bang methods of enumerables?

The bang method mutates the input values. If you make a mistake, there's no going back. It's best to not use bang & reassign the result to another value _or_ wrap the enumerable and its result in a new method that returns the result.
