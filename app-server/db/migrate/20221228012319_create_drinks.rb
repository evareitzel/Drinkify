class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :glass
      t.string :instructions_en
      t.string :instructions_sp 
      t.string :ingredient1
      t.string :ingredient2
      t.string :ingredient3
      # t.string :ingredient4
      # t.string :ingredient5
      t.string :measure1      
      t.string :measure2
      t.string :measure3
      # t.string :measure4
      # t.string :measure5
      t.integer :mixologist_id
      t.timestamps
    end
  end
end
