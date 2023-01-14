class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :mixologist_id
      t.string :ingredients
      t.string :instructions

      t.timestamps
    end
  end
end
