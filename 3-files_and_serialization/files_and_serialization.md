### How would you go through the lines of a file using the IO object in the command line?

````ruby
IO.sysopen '/path/to/filename'```
````

```
=> x
```

```ruby
file = IO.new(9)
while file.eof? == false
    file.gets
end
```

### How would you take the Array [1,2,3] and serialize it into a JSON string format?

```ruby
require 'json'

json_obj = JSON.dump = ({
        data: [1,2,3]
    })
```

```ruby
Array.new(JSON.load(json_obj)['data'])
=> [1, 2, 3]
```

### What are the benefits of YAML vs JSON vs MessagePack serialization formats?

`Yaml` = human readable, easily converts into objects. `JSON` = human readable & also the standard on the web. `MessagePack` is binary (so not human readable) but much more space efficient.

### How would you check if a file exists using the File object in the command line?

```ruby
if File.exists?(filename)
    …
end
```

### In a Download directory containing 5 files, how would you count the number of files in that directory using the Dir object?

`Dir.glob('Downloads/*').length`
