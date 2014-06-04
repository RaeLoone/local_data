class ChangeThingsUp < ActiveRecord::Migration
  def change
  	rename_column :events, :location, :event_location
  	rename_column :events, :latitude, :event_latitude
  	rename_column :events, :longitude, :event_longitude
  end

end