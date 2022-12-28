class CreateMixologists < ActiveRecord::Migration[6.1]
  def change
    create_table :mixologists do |t|
      t.string :name
      t.timestamps
    end
  end
end
