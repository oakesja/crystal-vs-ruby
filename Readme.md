# Crystal vs Ruby

## Goals of Crystal

* Ruby's efficiency for writing code by have nearly the same syntax
* C's efficiency for running code by compiling to efficient native code.

## Why

[fib.rb](fib/fib.rb)
```ruby 
def fib(n)
	if n == 0 || n == 1
		n
	else 
		fib(n-1) + fib(n-2)
	end
end

puts fib(ARGV[0].to_i)
```

[fib.cr](fib/fib.cr)
```crystal 
def fib(n)
	if n == 0 || n == 1
		n
	else 
		fib(n-1) + fib(n-2)
	end
end

puts fib(ARGV[0].to_i)
```

Benchmark of computing the first 30 fibonacci numbers
![alt text](images/fibonacci-30.png)

Benchmark of computing the first 45 fibonacci numbers
![alt text](images/fibonacci-45.png)

Benchmarks done using ruby 2.2.0 and crystal 0.7.5

## Comparison of the two

### Compiler

### Typing

### Arrays

### Strings

### Classes

### Functions vs Procs

### Macros

### GC? 

'' for chars
"" for string

can have relative paths in require
creating arrays
index out of bounds errors
abstract classes
no keyword arguments

## Knapsack problem example

[Ruby implementation](knapsack/ruby) 

[Crystal implementation](knapsack/crystal) 

``` ruby
capacity = 6404180
weights = [382745, 799601, 909247, 729069, 467902, 44328, 34610, 698150, 823460, 903959, 853665, 551830, 610856, 670702, 488960, 951111, 323046, 446298, 931161, 31385, 496951, 264724, 224916, 169684]
values = [825594, 1677009, 1676628, 1523970, 943972, 97426, 69666, 1296457, 1679693, 1902996, 1844992, 1049289, 1252836, 1319836, 953277, 2067538, 675367, 853655, 1826027, 65731, 901489, 577243, 466257, 369261]
expected = [1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1]

# ruby - 186.505 s
# crystal - 99.274 s
```

Benchmarks done using ruby 2.2.0 and crystal 0.7.5

## Resources

* Github page - [https://github.com/manastech/crystal](https://github.com/manastech/crystal)
* Api docs - [http://crystal-lang.org/api/](http://crystal-lang.org/api/)
* Crystal libraries and resources - [http://veelenga.github.io/awesome-crystal/](http://veelenga.github.io/awesome-crystal/)
* Knapsack problem data sets - [https://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html](https://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html)
