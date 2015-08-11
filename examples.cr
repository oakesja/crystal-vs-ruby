# Fib example
# crystal build fib.cr
# time ./fib 25
# time ruby fib.rb 25

# No repl yet

# show off classes int, string, char

# creating array of certain types
x = [] of Int32 | String
x.push(1)
x.push("2")
puts x

# cannot add new types to an array
x = [1]
x.push(false)
puts x

# array index out of bounds
x = [1]
x[1]

# simple hash
x = {} of String => Int32
x["32"] = 32
puts x

# new types cannot be added to hashes
x = { x: 1 }
x["y"] = "2"
puts x

# procs
x = [1, 22, 333]
puts x.map &.to_s
puts x.map &.modulo(2)
puts x.map &.to_s.length
puts [[1, -2], [-3, -4]].map(&.map(&.abs))


# knapsack problem
# - started out copy and paste
# - spec similar to rspec
# - shard that uses expect instead of should
# - item class
# - intialize arrays
# - no combination so had to roll my own
# - sum
# - no keyword arguments


