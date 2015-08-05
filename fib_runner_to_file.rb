require 'benchmark'

def run_cmd(cmd)
	`#{cmd}` or raise "The following command failed to run #{cmd}"
end	

file = File.open('crystal-vs-ruby-fib.csv', 'w')
file.puts "Fib, Crystal Time, Ruby Time\n"
run_cmd('crystal build fib.cr --release')

(0..40).each do |n|
	crystal_time = Benchmark.realtime do 
	  run_cmd("./fib #{n}")
	end

	ruby_time =  Benchmark.realtime do 
	  run_cmd("ruby fib.rb #{n}")
	end
	file.puts "#{n},#{crystal_time},#{ruby_time}\n"
end	
file.close()
