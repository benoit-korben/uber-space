class CreateSpaceships < ActiveRecord::Migration[7.1]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.text :description
      t.integer :number_of_places
      t.integer :price_per_day
      t.string :fuel
      t.boolean :is_available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
