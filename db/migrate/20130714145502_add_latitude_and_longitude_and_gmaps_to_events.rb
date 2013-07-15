class AddLatitudeAndLongitudeAndGmapsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gmaps, :boolean
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end
end
