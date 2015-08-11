require 'benchmark'
require 'gruff'

files = %w(5.txt 10.txt 15.txt 24.txt)
file_paths = files.map { |f| File.expand_path(f) }
ruby_times = file_paths.map do |path|
  time = Benchmark.realtime { `ruby ruby/knapsack.rb #{path}` }
  puts path, time
  time
end

Kernel.system('crystal build crystal/knapsack.cr --release')
crystal_times = file_paths.map do |path|
  time = Benchmark.realtime { `./knapsack #{path}` }
  puts path, time
  time
end

g = Gruff::Line.new(800)
g.title = 'Knapsack Problem'
g.labels = {0 => '5', 1 => '10', 2 => '15', 3 => '24'}
g.data(:ruby, ruby_times)
g.data(:crystal, crystal_times)
g.write('knapsack.png')
