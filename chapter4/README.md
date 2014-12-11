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

## while and repeat statements

As in other languages, the `while` statement will repeat an operation until a
condition is `true`.

```lua
local iterations = 10
while iterations > 0 do
  print(iterations)
  iterations = iterations - 1
end
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
Numeric loops are look similar to for loops in C do not behave the same. The
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

As with `while` and `repeat` loops the `break` keyword can be used to terminate
the `for` loop early.

Generic `for` loops are great for use with iterative functions. This example
uses the `pairs` function in Lua, this function allows iteration over the keys
of a table. This bit of code prints each key in `html_colors`.
```lua
local html_colors = {blue="#0000ff", green="#00ff00", indigo="#4b0082"}
for key in pairs(my_table) do
  print(key)
end
```

[Previous Chapter: Variables and types in Lua](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter3)
