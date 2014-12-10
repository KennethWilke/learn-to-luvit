# The strange bits of Lua

Now that we have Luvit installed, we're ready to start pounding out some Lua.
Before we get too into it though lets look at some of the syntax of Lua and
some of the ways Lua is a bit different than other common languages.

Lua.org has a good book that covers the Lua programming language in more depth,
the first edition is freely available at http://www.lua.org/pil/contents.html

Even though we haven't touched on the Lua language at all, I want to share the
3 main things that I find important to understand about Lua.

## The syntax of Lua

Lua is not in the syntactic style of C, full of semicolons and curly brackets,
wonderful as they are. Lua is also not a pythonic or rubyish language; newlines
aren't part of your syntax either. Lua cares little of your usage of
whitespace. Spaces, tabs, newlines are all treated the same. That being said,
most Lua programmers will still use spacing in rational ways to improve the
readability of code, but it's important to understand that the interpreter
doesn't treat it as syntax.

In most languages newlines, spacing or curly brackets are used delimit blocks
of code, but in Lua code blocks are started by a keyword like `do` or `then`
and completed with `end`. Parenthesis have the normal pairing action where you
must close what you open, and the expression within parenthesis will be
executed before the expression that contains the parenthesis.


The following two blocks of code execute identically
```lua
salutation = "Hello World!"
print(salutation)
```
```lua
salutation = "Hello World!" print(salutation)
```
Both output the quintessential ```Hello World!```

## Everything is true, unless it is false or nil

In the Lua world of boolean values, everything is true unless it is `nil` or
`false`. In most languages the value `0` would evaluate as false, but in lua
`0` is true.

```lua
if 0 then
  print("Really, it's true!")
end
```

In some languages, like Python, empty strings are considered to be a false in
boolean operations, but in Lua this is also true.

```lua
if "" then
  print("Empty strings are true! Why not?!")
end
```

## Lexical scoping (Closures)

Lexical scoping can be a little odd if this is your first run in with it. It's
all about a function defined within another function that has the scope of the
function it was defined in. I haven't gotten very far into lua's constructs
yet, but this deserves a concrete example:

```lua
function range(start, stop)
  local current = start - 1
  return function()
    current = current + 1
    if current <= stop then
      return current
    end
  end
end

generator = range(0, 5)

for i in generator do
  print(i)
end
```

When executed, this block of code will output:
```
0
1
2
3
4
5
```

The range function returns an anonymous function that references a variable
above its scope, known as an upvalue. When the `range()` function is executed
it returns a new instance of the function defined within, here stored to the
variable `generator`. This instance of the function carries with it its own
`start`, `stop` and `current` variables. When the `generator` variable is used
in the `for` loop that function will be called until no value is returned
(`nil).

Don't worry if you don't understand lexical scoping quite yet, they can be
tricky but they are also very useful. Come back to them later once you have a
better grasp of Lua or a need for them.
