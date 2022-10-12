### What is a stack trace?

### What is generally the most useful line in a stack trace?

Generally the first line. It contains the filename and line number where the issue occurred in addition to a type of error.

### What are the two things you can learn from the first line of a stack trace?

What kind of logic error it was & where it occurred in your program.

### How do puts and Pry help you in the debugging process?

With `puts` you can print state at various points and inspect it that way. With `pry` you can interactively debug at a specific point with `binding.pry` and see what was present / not presetn.

### What should you use instead of puts for nil values?

Because `puts` will print an empty string (which could be missed when debugging), `p` is preferrable.

### Where should you start with debugging if you encounter a runtime error?

Start with the stacktrace.

### Where should you start with debugging if your program runs but does not work the way you expect?

Examine a base case of where the logic _does_ work (e.g. outside a method) and then work your way in. Typically with print statements, but ideally with tests.
