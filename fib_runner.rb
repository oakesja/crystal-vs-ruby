require 'benchmark'

def run_cmd(cmd)
	Kernel.system(cmd) or raise "The following command failed to run #{cmd}"
end	

def benchmark(label, &block) 
	time = Benchmark.realtime(&block)
	puts "#{label} : #{time}"
end	

n = ARGV[0].to_i
puts "#{n} Fibonacci number"
run_cmd('crystal build fib.cr --release')

benchmark('cyrstal') do 
  run_cmd("./fib #{n}")
end

benchmark('ruby') do 
  run_cmd("ruby fib.rb #{n}")
end

