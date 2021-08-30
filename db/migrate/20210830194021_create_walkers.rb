class CreateWalkers < ActiveRecord::Migration[5.2]
  def change
    create_table :walkers do |t|
    t.string :walker_name
    end
  end
end
