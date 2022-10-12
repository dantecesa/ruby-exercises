### What are the differences between hashes and arrays?

Hashes have named keys vs. an numbered index. A hash is unordered. & when you call a key that does not exist in a hash, it returns `nil` (vs. out of bounds).

### What are keys and values in a hash?

A `key` is the named variable within the hash that recalls the `value` stored within.

### How can you create a new hash?

```
variable_name = Hash.new
variable_name = {}
```

### How can you populate a hash with data?

You can specify a key & value directly (e.g. `variable_name["key"] = value`). You can also do this while creating the hash by passing in keys & values either by hashrockets (e.g. `{ a => "b"}`) or in a more JSON like structure (e.g. `{ a: "b"}`).

### How can you change existing values within a hash?

Specify the key directly (just as if you were setting it the first time).

### How can you delete existing data from a hash?

Call `.delete("[key]")` on the hash. E.g. `hash.delete("key")`.

### How can you merge two hashes together?

You can with `.merge()`. You pass a hash in as the parameter onto the hash which it is being merged into. E.g. `hash_receiving.merge(hash_being_merged_in)`.

### Why is it preferred to use symbols as hash keys

Purportedly because symbols are more performant than keys. The other reason is for syntax / readability / laziness (less quote marks!).
