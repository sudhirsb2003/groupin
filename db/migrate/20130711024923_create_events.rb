class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :address
      t.string :pincode
      t.string :city_name
      t.string :state_name
      t.string :country_name
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :no_of_people
      t.string :contact_number
      t.string :slug
      t.timestamps
    end
    add_index :events, :slug, unique: true
  end
  
end
