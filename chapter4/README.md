# Writing Lua

In this chapter we'll dig into Lua expressions and statements.

## Comments

Comments in Lua come in two forms, single line comments and multi-line
comments. Single lin comments start with `--` and continue to the end of the
line. Multi-line comments begin with `--[[` and end with `]]`.

```lua
-- This is a comment
if writing_code then
  print("Woooo!")
--[[
else
  print("Darn!")
]]
end
```

Something nifty about the syntax of Lua comments, is that if you close a
multiline comment with `--]]` you can add a single dash to the start of that
comment to uncomment the whole block.

```lua
--[[
  print("nifty!")
--]]
```

```lua
---[[
  print("nifty!")
--]]
```

## Variable Assignment

As mentioned before, variables in Lua can be declared in global or local
contexts. Lua also supports multiple declarations and multiple assignment.

```lua
local local_var1, local_var2 = "this", "works"
```

Multiple assignment also allows you to swap variables if you're so inclined.

```lua
local x, y
x = 5
y = 10

y, x = x, y -- y is now 5, x is now 10
```

## if statements

If statements in Lua are in the form: `if` CONDITION `then` CODE BLOCK `end`.
The `elseif` keyword can be used to add additional conditions and `else` can be
used for `false` conditions.

```lua
local animal = "bear"
if animal == "lion" then
  print("Big ol' scary cat!")
elseif animal == "tiger" then
  print("Big ol' scary cat with stripes!")
elseif animal == "bear" then
  print("Big ol' scary animal, but it's not a cat!")
else
  print("I don't know what kind of animal that is!")
end
```

In Lua the relational operators are similar to most languages. `<` `>` `<=`
`>=` and `==` have their usual semantics. For not-equals Lua provides `~=`.

For logical (boolean) operations the keywords `and` `or` and `not` may be used.

In Lua, if the `and` operation hits a value that evaluates to `nil` or `false`
that value will be returned.
```lua
local test = nil and false  -- test will be nil
test = false and nil        -- test will be false
```

If both operands of the `and` operation are valid, the last will be the
returned value of that operation.
```lua
local test = 1 and true  -- test will be true
test = true and "hay!"   -- test will be "hay!"
```

This is similar to what the `or` operation does, this operation will return the
first value that evaluates to true.
```lua
local test = false or true  -- test will be true
test = "woooooo" or nil     -- test will be "woooooo"
```

The `not` operator in Lua always returns a boolean type value.

## while and repeat statements

As in other languages, the `while` statement will repeat an operation until a
condition is `false`.

```lua
local iterations = 10
while iterations > 0 do
  print(iterations .. " > 0 is " .. tostring(iterations > 0))
  iterations = iterations - 1
end
print(iterations .. " > 0 is " .. tostring(iterations > 0))
```

Lua also has the `repeat` statement that is similar to a do-while loop in other
languages in that this loop will always iterate at least once, but it uses the
`until` keyword to continue iterating until a condition is `false`.

```lua
local iterations = 10
repeat
  print(iterations)
  iterations = iterations - 1
until iterations < 1
```

In both of these loops the `break` keyword can be used to bail out regardless
of the state of the conditional.

```lua
local iterations = 10
local stop_at = 5
while iterations > 0 do
  print(iterations)
  if iterations == stop_at then
    print("breaking out!")
    break
  end
  iterations = iterations - 1
end
```

## for loops

`for` loops in Lua come in two flavors, numeric and generic (iterative) loops.
Numeric loops look similar to for loops in C but do not behave the same. The
first expression is an initializer still, but the second expression is not a
condition it is a limit. The third, optional, expression is a step value that
will be added to the loops iterator, 1 if not specified.

Count from 1 to 10
```lua
for i=1,10 do
  print(i)
end
```

Even numbers between 10 and 1
```lua
for i=10,1,-2 do
  print(i)
end
```

As with `while` and `repeat` loops, the `break` keyword can be used to terminate
the `for` loop early.

Generic `for` loops are great for use with iterative functions. This example
uses the `pairs` function in Lua, this function returns an iterator that
returns each key in a table. This bit of code prints each key in `html_colors`.
```lua
local html_colors = {blue="#0000ff", green="#00ff00", indigo="#4b0082"}
for key in pairs(html_colors) do
  print(key)
end
```

## Functions

At last, we've gotten to the mighty `function` statement! Functions are pretty
much the same as in other languages.

```lua
function do_thangs(argument1, argument2)
  print(argument1)
  print(argument2)
  return argument2
end
```

Functions can return multiple variables and functions that have no `return`
statements return `nil`. 
```lua
function moar_thangs()
  return 12, 34
end

local x, y = moar_thangs()
```

Like JavaScript, Lua supports anonymous functions. These are unnamed functions
but they can be assigned to variables, making the two examples below
effectively the same. 
```lua
local wrap_with_h1 = function(wrap_this_string)
  print("<h1>" .. wrap_this_string .. "</h1>")
end
```
```lua
function wrap_with_h1(wrap_this_string)
  print("<h1>" .. wrap_this_string .. "</h1>")
end
```

The `..` operator in this example is Lua's string concatenation operation.

[Previous Chapter: Variables and types in Lua](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter3)

[Next Chapter: Object-oriented design patterns in Lua](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter5)
