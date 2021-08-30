class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
    t.datetime :walk_appt
    t.integer :walker_id
    t.integer :user_id
    end
  end
end
