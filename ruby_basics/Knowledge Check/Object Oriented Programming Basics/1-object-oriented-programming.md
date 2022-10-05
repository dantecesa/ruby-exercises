### What is a class?

A blueprint that defines an object – both in what variables it contains, but also methods it can access. Most everything in Ruby is an object, and therefore is instantiated by its parent class. Sidebar: Classes have a constructor method called `initialize` wherein we set up the class with all of its default variables.

### What are getters and setters?

Getters and Setters are methods that let us expose reading or writing class variables to the beyond the classes scope. They can be defined manually (e.g. `def health; @health; end`) or by Ruby itself using the `attr_reader`, `attr_writer` or `attr_accessor` (both read & write) methods.

Also, it's advised to use the getter and setter methods _within_ the class when reading / writing class variables vs. directly (i.e. not `@variable_name`) as it creates a consistent interface for accessibility.

### What is inheritance?

Inheritance allows us to define a "parent" class which our class inherits from. In this way methods or constant available on the parent are visible from within our class. This is done with the `<` syntax – e.g. `class Dog < Animal`.

### What is a scope?

Scope is a term used to define when a variable _is_ or _is not_ accessible. Scope is governed by a method or a block – e.g. variables defined within a method are not accessible outside it.

Scope however is one-way, meaning while a method can restrict access to a variable (or methods) within it, that same method can query variables (& methods) defined outside of it.

### When is a new scope defined?

Every time you create a method, or a block.

### What is the purpose of instance variables?

Instance variables let us store data that's unique to an instance of a class.

### What is the difference between class variables and instance variables?

Class variables are shared across all instances of a class. This contrasts with instance variables which are defined per instance of a class. Class variables are useful for defining data or behaviors that are not unique per instance (e.g. a shared attribute, constant, or even a factory method).
