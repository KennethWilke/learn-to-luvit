# Writing Lua

In this chapter we'll dig into the core syntax of Lua, with some examples of
most types and control structures.

## Variable names (Identifiers)

Lua follows the convention setup by most other languages for variable naming.
Variables start with a letter or underscore, and after the initial character
can contain numbers as well.

### Variable scope

When first setting a variable in Lua, you can control whether that variable is
in a global or local context. By default, variable assignments to undefined
variables will declare the said variable as a global variable unless the
keyword `local` is used.

```lua
this_is_a_global = true
local this_is_not_global = true
```

## Variables and Types in Lua

Lua is a simple language. It is dynamically typed and there are only a few
types.

The `nil` type is the simplest type and represents an unset value. Setting a
variable to `nil` effectively removes that variable from this plane of
existence. In Lua, you can use an undeclared variable, all undeclared variables
share the initial value `nil`.

For boolean operations the values `true` and `false` are defined, representing
their expected meanings.

Functions are a type in Lua as well, they can be assigned to variables like
anything else.

```lua
local write = print
write("Hello!")
```

There is also a `userdata` type in Lua, which usually represents arbitrary C
data. Lua is designed as an embedded language and `userdata` could be used to
refer to things like C structures.

### Numbers in Lua

In Lua, there are no separate types for integers or floating point numbers. All
numbers are real numbers usually represented as a `double` type under the hood.

Even though this means all numbers are floating point numbers, arithmetic
operations are still fast and you can rely on the number type for increment and
decrement operations.

### Strings in Lua

Strings in Lua are a sequence of bytes as in many other languages. They are
binary safe so you may even include zero values into a string in Lua.

Strings can be delimited by single quotes, double quotes, or double square
brackets. You can choose which ever feels most appropriate to you, there is no
syntactic difference between single and double quotes. Double square brackets
are commonly used for multi-line strings, and as some syntactic sugar if the
first character within the string is a newline it will be ignored.

```lua
local my_string_singles = 'Hello!'
local my_string_doubles = "What's up?"
local my_multiline_string = [[
I replied, "I'm learning this Lua thing."
]]
```

### Tables in Lua

It's an array! It's an associative array! It's an object!

Tables are THE complex type in Lua. They can be used like an array or list,
like a dictionary, hash map, or associative array, and they provide a nice
means to make objects for object oriented styles of programming. So fancy!

#### Using a table as an array or list

TODO
