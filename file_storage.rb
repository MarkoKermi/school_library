require 'pry'

class HandleData 

	def self.read(file_name)
	 file_name = "data/#{file_name}.json"
	 if File.zero?(file_name)
		 []
	 else
		 data = File.read(file_name)
		 parsed_data = JSON.parse(data)
	 end
	rescue
	 puts "!!#{file_name}file not found !!"
	 []
	end
 
	def self.write(file_name, data_array)
		file_name = "data/#{file_name}.json"
		json_string = JSON.dump(data_array)
		File.open(file_name,'w') {|f| f.write(json_string)}


	rescue 
		puts 'Unable to save to file'
	end
 end