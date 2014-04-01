class AddChangeThings < ActiveRecord::Migration
  def change
  		add_column :events, :location_id, :float
  	
  		create_table :locations do |t|
  	  t.float :latitude
  	  t.float :longitude
  	  t.string :location

  	  t.timestamps
  	end
  end
end
