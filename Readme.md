# Crystal vs Ruby

## Goals of Crystal

* Ruby's efficiency for writing code by have nearly the same syntax
* C's efficiency for running code by compiling to efficient native code.

## Why
It is fast!!!

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

## Comparison

### Compiler

**Ruby**
* Ruby 1.9 the Yet Another Ruby Virtual Machine (YARV) was introduced
* Code is parsed and then compiled to YARV instructions
* YARV instructions are interpreted to native code
* Written in C

![alt text](images/ruby-compiler.png)

from [*Ruby Under a Microscope*](http://www.amazon.com/Ruby-Under-Microscope-Illustrated-Internals/dp/1593275277)
by Pat Shaughnessy 

**Crystal**
* Compiled directly to native code
* Originally written in Ruby
* Now written in Crystal

### Typing

**Ruby**
Dynamic typing at runtime

**Crystal**
Infered typing at compile time

``` crystal
x = 1 				# x is an Int32

x = if false		# x is an Int32 | String
		1
    else
		"1"
    end
```

Most of the time the type can be inferred except in certain cases

<!--
``` crystal
[] 				# Syntax error: for empty arrays use '[] of ElementType'
[] of Int32			# Empty array that can hold Int32s
[] of (Int32 | String)		# Empty array that can hold both In32s or Strings

{} 				# Syntax error: for empty hashes use '{} of KeyType => ValueType'
{} of String => Int32		
```
-->

### Classes
* Abstract classes

``` crystal
abstract class Fish
  
  	abstract def name
    
 	def type
     	"Fish"
  	end  
end
  
class StingRay < Fish
  
	def name
      "sting ray"
    end   
end
  
x = StingRay.new
puts x.name				# "sting ray"
puts x.type				# "Fish"
Fish.new.type			# can't instantiate abstract class Person:Class
```

* getter, setter, property instead of attr_reader, att_writer, attr_accessor

``` crystal
class Item
  getter id
  property name
  setter size

  def initialize(id, name, size)
    @id = id
    @name = name
    @size = size
  end
end

x = Item.new(1, "name", 2)
x.id
x.name
x.name = "test"
x.size = 1
x.id = 2		# Error
x.size			# Error
```

### Other intersting concepts
* Macros
* Tuples
* C bindings

## Knapsack problem example

[Ruby implementation](knapsack/ruby) 

[Crystal implementation](knapsack/crystal) 

 Number of Items 	| Ruby Time 	| Crystal Time 	
 --------------- 	| --------- 	| ------------ 	
 5			| 0.2936 s	| 0.0050 s
 10			| 0.1808 s	| 0.0095 s
 15			| 0.2342 s	| 0.0874 s
 24			| 68.6674 s	| 34.3023 s


Benchmarks done using ruby 2.2.0 and crystal 0.7.5

## Additional resources
* Crystal's Github page - [https://github.com/manastech/crystal](https://github.com/manastech/crystal)
* Crystal's api docs - [http://crystal-lang.org/api/](http://crystal-lang.org/api/)
* Crystal libraries and resources - [http://veelenga.github.io/awesome-crystal/](http://veelenga.github.io/awesome-crystal/)
* Play with Crystal online - [http://play.crystal-lang.org/#/cr](http://play.crystal-lang.org/#/cr)
