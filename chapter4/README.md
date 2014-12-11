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
used for false conditions.

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
condition is true.

```lua
local iterations = 10
while iterations do
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
