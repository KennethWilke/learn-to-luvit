# The strange bits of Lua

Now that we have Luvit installed, we're ready to start pounding out some Lua.
Before we get too into it though lets look at some of the syntax of Lua and
some of the ways Lua is a bit different than other common languages.

Lua.org has a good book that covers the Lua programming language in more depth,
the first edition is freely available at http://www.lua.org/pil/contents.html

## The syntax of Lua

Lua is not in the syntactic style of C, full of semicolons and curly brackets,
wonderful as they are. Lua is also not a pythonic or rubyish language, newlines
aren't part of your syntax either. Lua cares little of your usage of
whitespace: spaces, tabs, newlines are all treated the same. That being said,
most Lua programmers will still use spacing in rational ways to improve the
readability of code, but it's important to understand that the interpreter
doesn't treat it as syntax.

In most languages newlines, spacing or curly brackets are used delimit blocks
of code, but in Lua code blocks are started by a keyword like `do` or `then`
and completed with `end`. Parenthesis have the normal pairing action where you
must close what you open, and the expression within parenthesis will be
executed before the expression that contains the parenthesis.


The following blocks of code execute identically
```lua
salutation = "Hello World!"
print(salutation)
```
```lua
salutation = "Hello World!" print(salutation)
```



## Everything is true, unless it is false or nil

In the Lua world of boolean values, everything is true unless it is `nil` or
`false`. 
