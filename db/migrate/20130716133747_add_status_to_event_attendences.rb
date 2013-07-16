class AddStatusToEventAttendences < ActiveRecord::Migration
  def change
    add_column :event_attendences, :status, :string
  end
end
