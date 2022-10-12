## Numbers

### What are the basic arithmetic operators you can use on numbers?

- Addition `+`
- Subtraction `-`
- Multiplication `*`
- Division `/`
- Exponents `**` (e.g. `2^3` == `2 ** 3`)
- Modulo `%`

### What’s the difference between an integer and a float?

- Integer = whole number (no decimal) – e.g. `5`
- Float = precise number (w/ decimals) – e.g `5.0`

### What method would you use to convert a float to an integer?

The method `.to_i`.

### What method would you use to convert an integer to a float?

The method `.to_f`.

## Strings

### What is a string?

Collection of characters.

### What are the differences between single and double quotes?

Both wraps text so that Ruby knows their contents are a string. Double quotes `"` however allow Ruby to do interpolation, which is achieved with a `#{variable_name}`.

### What is string interpolation?

When you pass in Ruby into a placeholder within the string. This could be a variable (e.g. `"Hi my name is #{name}"`) or an expression (e.g. `"Total x tax = ${total * tax}"`).

### How do you concatenate strings?

You can use the `+` operator to concatenate strings.

### What method would you use to change all the characters in your string to upper case?

`.upcase`

### What method would you use to split up strings into arrays?

`.split("[separator]")` where `separator` is equal to the character you'd like to split by (e.g. a space ` ` or a new line`\n`) .

### What are escape characters?

"Hidden" (as in non visible) characters that allow you to perform specific functions. E.g. Create a new line `\n` or don't treat this quotation mark as the end of a string `\"`.

Coped from the course below

```
\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark
```

### How do you access a specific character or substring?

I think (?) under the hood these are arrays of characters. Regardless you can pass in the index or range of the character(s) you want.

E.g.

```
a = "hello"
a[0] => "h"
a[3..5] => "lo"
```

### How do you convert other data types into strings?

`.to_s`

## Symbols

### What is a symbol?

As best I understand it, instead of creating new objects and moving pointers, you're telling Ruby to use the same object but mutate its internals.

E.g.

```
normal_var = hello // id = 1
normal_var = bye // id = 2
:a_symbol = hello // id = 3
:a_symbol = bye // id = 3
```

### How do you create a symbol?

Prepend the variable name with `:` when assigning to a variable name.

### What’s the difference between a symbol and a string?

Same as above? A symbol retains the same memory address, even when replaced. This is faster but I'd assume runs into issues with allocation (e.g. what if you replace a small string with a much larger one? presumably, you do have a memory cost then?). The notes do say this is for keys, so that seems contrived but 🤷🏻‍♂️.

## Booleans

### What does true represent?

truthy

### What does false represent?

falsey

### What does nil represent?

Has never been assigned.
