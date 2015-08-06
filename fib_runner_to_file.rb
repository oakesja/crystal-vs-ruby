require 'benchmark'
require 'gruff'

class FibRunner
	def run_cmd(cmd)
		Kernel.system(cmd) or raise "The following command failed to run #{cmd}"
	end	

	def run(n)
		run_cmd('crystal build fib.cr --release')
		crystal_times = []
		ruby_times = []

		(0..n).each do |n|
			crystal_time = Benchmark.realtime do 
			  run_cmd("./fib #{n}")
			end

			ruby_time =  Benchmark.realtime do 
			  run_cmd("ruby fib.rb #{n}")
			end
			crystal_times.push(crystal_time)
			ruby_times.push(ruby_time)
		end	

		g = Gruff::Line.new(2000)
		g.title = "Fibonacci 0 - #{n}"
		g.labels = labels(0, n)
		g.data(:ruby, ruby_times)
		g.data(:crystal, crystal_times)
		g.write("fibonacci-#{n}.png")
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

FibRunner.new.run(30)