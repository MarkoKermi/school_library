class HandleData 

	def self.read(file_name)
	 file_name = "data/#{file_name}.json"
	 if File.zero?(file_name)
		 []
	 else
		 data = File.read(file_name)
		 JSON.parse(data)
	 end
	rescue
	 puts "!!#{file_name}file not found !!"
	 []
	end
 
	def self.write
	end
 end