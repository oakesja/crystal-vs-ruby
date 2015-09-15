require 'benchmark'
require 'gruff'

class FibRunner
	def run_cmd(cmd)
		Kernel.system(cmd) or raise "The following command failed to run #{cmd}"
	end	

	def run(n)
		run_cmd('crystal build fib.cr --release')
		crystal_times = benchmark_up_to(n) { |i| run_cmd("./fib #{i}") }
		cleanup
		# ruby_times = benchmark_up_to(n) { |i| run_cmd("ruby fib.rb #{i}") }
		# jruby_times = benchmark_up_to(n) { |i| run_cmd("jruby fib.rb #{i}") }
		# rubinius_times = benchmark_up_to(n) { |i| run_cmd("~/rubinius/bin/rbx fib.rb #{i}") }
		run_cmd('gcc fib.c -o fib')
		c_times = benchmark_up_to(n) { |i| run_cmd("./fib #{i}") }
		cleanup

		g = Gruff::Line.new(800)
		g.title = "Fibonacci 0 - #{n}"
		g.labels = labels(0, n)
		# g.data(:ruby , ruby_times)
		g.data(:crystal, crystal_times)
		# g.data(:jruby, jruby_times)
		# g.data(:rubinius, rubinius_times)
		g.data(:c, c_times)
		g.write("fibonacci-#{n}-c-crystal
.png")
	end

	def benchmark_up_to(n)
		(0..n).collect do |i|
			Benchmark.realtime { yield i }
		end
	end

	def cleanup
		File.delete('fib')
	end

	def labels(min_x, max_x)
		delta = (max_x - min_x) / 3
		labels = {}
		(min_x..max_x).step(delta) do |n|
		    labels[n] = n.to_s
		end
		labels
	end	
end

FibRunner.new.run(ARGV[0].to_i)