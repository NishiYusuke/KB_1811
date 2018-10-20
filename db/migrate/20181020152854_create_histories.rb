class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.boolean :in_or_out
      t.string :user_id

      t.timestamps
    end
  end
end
