class AddThings < ActiveRecord::Migration
  def change
  	change_column :events, :location_id, :integer
  end
end
