class Location < ActiveRecord::Base
	# Fields we get from NYTimes
	attr_accessible :name, :location, :description

	attr_accessible :latitude, :longitude, :location


	def gmaps4rails_address
		address
	end	

	
end