class AddNoOfPeoplePresentToEvents < ActiveRecord::Migration
  def change
    add_column :events, :no_of_people_present, :integer
  end
end
