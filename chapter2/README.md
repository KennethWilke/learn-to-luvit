# The strange bits of Lua

Now that we have Luvit installed, we're ready to start pounding out some Lua.
Before we get too into it though lets look at some of the syntax of Lua and
some of the ways Lua is a bit different than other common languages.

As with any language it's important to keep good documentation close at hand.
Lua.org has a good book that covers the Lua programming language in depth,
the first edition is freely available at http://www.lua.org/pil/contents.html
Additionally, the [Lua Reference Manual](http://www.lua.org/manual/5.1/) is
also extremely helpful. Luvit uses LuaJIT under the hood, so
[those extensions](http://luajit.org/extensions.html) are part of the luvit
ecosystem as well.

Even though we haven't touched on the Lua language at all, I want to share the
5 main things that I find important to understand about Lua.

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

## Lua starts at 1 for indexing

When you use the `table` type or `string` type in Lua, you may be surprised to
notice that the first element is at index 1. This can be odd when you're used
to starting at0, but is something you get used to after a short time.

## Function calls don't require parenthesis

I still recommend using parenthesis since it improves code readability, but
it's important to know that functions can be called without them. Without
parenthesis you can only supply a single argument to the function, which will
be the next identifier in your code.

These two lines are identical in operation
```lua
print("hello!")
print "hello!"
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

[Previous Chapter](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter1)

[Next Chapter](https://github.com/KennethWilke/learn-to-luvit/tree/master/chapter3)
