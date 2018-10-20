class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :room_id
      t.string :attachment

      t.timestamps
    end
  end
end
