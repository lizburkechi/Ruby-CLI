class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :dog_name
      t.integer :dog_age
      t.string :breed
      t.boolean :likes_walks
    end
  end
end
