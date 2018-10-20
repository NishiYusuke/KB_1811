class AddFrontPersonToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :front_person, :integer
  end
end
