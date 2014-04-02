class Event < ActiveRecord::Base
	require 'json'
	require 'rest_client'

	attr_accessible :name, :description, :location_id

	def getCoordinates address
		arr = Array.new

		address = address.split(" ").join("+")

		map_api_base = "http://maps.googleapis.com/maps/api/geocode/json?address="
		map_api_tail = "&sensor=false"
		map_request = map_api_base + address + map_api_tail

		map_json_reply = JSON.load( RestClient.get ( map_request ) )
		lat = map_json_reply["results"][0]["geometry"]["location"]["lat"]
		lng = map_json_reply["results"][0]["geometry"]["location"]["lng"]
		arr << lat

		arr<< lng

		arr

	end

	def callEvents(arr)
		lat = arr[0]
		lng = arr[1]
		nyt_api_key = "cd4e266e7184a5edd6d9376a1d3dd831:18:68958109"
		latlng = "#{lat},#{lng}"
		nyt_api_request = "http://api.nytimes.com/svc/events/v2/listings.json?ll=#{latlng}&radius=500&sort=dist+asc&api-key=#{nyt_api_key}"
		events_json_response = JSON.load ( RestClient.get ( nyt_api_request ) )

		events_json_response
	end

	def buildEvents(events_json_response)
		events = Array.new

		events_json_response["results"].each do |result|
			event = {}
			event[:name] = result["event_name"]
			event[:location] = "#{result["neighborhood"]}, #{result["street_address"]} #{result["cross_street"]}"
			event[:description] = result["web_description"]

				# event = Event.create!(event)
			events << event	
		end	

		events
	end 

	def process(user_input)
		newLocation = {}
		newLocation[:location] = user_input
		
		e = Event.new
		ge = e.getCoordinates user_input
		
		newLocation[:latitude] = ge[0]
		newLocation[:longitude] = ge[1]
		
		gc = e.callEvents ge

		be = e.buildEvents gc

	
		location = Location.create!(newLocation)

		be

		# newEvent = {}
		# newEvent[:name].each do |name|
		# 	event
		# newEvent[:description] = be[:description]

		# event = Event.create!(newEvent)
		
	end



end	