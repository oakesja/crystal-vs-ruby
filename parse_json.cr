require "json"

class MyParser

	def parse_large
		parse(File.expand_path("large.json"))
	end	

	def parse_small
		parse(File.expand_path("small.json"))
	end	
 
 	private def parse(file_path)
		with_file(file_path) do |file|
			puts JSON.parse(file)
		end	
	end

	private def with_file(file_path) 
		File.open(file_path, "r") do |file|
			yield file
		end	
	end	
end	

puts MyParser.new.parse_small