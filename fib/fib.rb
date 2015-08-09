def fib(n)
	if n == 0 || n == 1
		n
	else 
		fib(n-1) + fib(n-2)
	end
end

puts fib(ARGV[0].to_i)