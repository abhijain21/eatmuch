class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating
      t.text :address

      t.timestamps
    end
  end
end
