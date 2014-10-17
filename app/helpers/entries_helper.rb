module EntriesHelper
	def display_time(time = 0) 
		ChronicDuration.output(time, :format => :long) 
	end
end