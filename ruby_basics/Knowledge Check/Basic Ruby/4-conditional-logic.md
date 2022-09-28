### What is a Boolean?

Represents a logic state in our code. Can either be `true` or `false`.

### What are “truthy” values?

Values that equate to `true`. In Ruby, everything but `false` or `nil` is truthy. This is unlike other languages where blank string (`""`) or zero (`0`) can sometimes equate `false`.

### Are the following considered true or false: nil, 0, "0", "", 1, [], {} and -1?

Everything but `nil` or `false` is considered true. Therefore…

- `nil` = `false`
- `0` = `true`
- `"0"` = `true`
- `""` = `true`
- `1` = `true`
- `[]` = `true`
- `{}` = `true`
- `-1` = `true`

### When do you use elsif?

When you need control logic to take three or more paths within a conditional block.

### When do you use unless?

When you need to express `false`-y control logic without having to negate the condition (e.g. with a `!`). It's a cleaner way of representing not (e.g. `![expession]`).

### What do || and && and ! do?

- `||` == or
- `&&` == and
- `!` == not (e.g. flips the truthiness of a statement)

### What is short circuit evaluation?

An optimization whereby we stop checking the rest of the expression as we've logically reached a dead end.

Consider an _and_ (`&&`) statement. If the left expression evaluates to `false`, the entire statement can never return `true` – therefore it's not worth checking the right side.

Similarly with an _or_ (`||`) statement. If the left expression evaluates to `true` we can stop execution as we'll enter the block irrespective of whether the right side evaluates to `true` or `false`.

### What is returned by puts("woah") || true?

`true` is returned because `puts ("woah")` returns `nil` (false), but our _or_ evaluates to `true`. One side of the _or_ is necessary to return true.

### What is the ternary operator?

A shorthand for writing if / else blocks. Written as such:
[expression] ? [do this while true] : [do this while false]

### When should you use a case statement?

Another shorthand for if / else, but useful when you have many elsif cases you need to check (&& therefore the boilerplate that comes along is annoying). This seems similar to switch statements in Swift / JS.
