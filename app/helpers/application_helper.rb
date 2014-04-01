module ApplicationHelper
	def events(events)
		events.each do |event|
			puts "Name: #{event[:name]}"
			puts "Location: #{event[:location]}"
			puts "Description: #{event[:description]}"
		end
	end	
end
# The module for Helper is a method that can be use in the view as a helper.