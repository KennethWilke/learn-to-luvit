local salutation = "Hello World!" print(salutation)


if 0 then
  print("Really, it's true!")
end

if "" then
  print("Empty strings are true! Why not!?")
end


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
