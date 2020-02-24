class CreateBarrows < ActiveRecord::Migration[5.2]
  def change
    create_table :barrows do |t|
      t.string :name
      t.string :description
      t.string :town
      t.string :category
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
