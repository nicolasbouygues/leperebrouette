class AddCoordinatesToBarrows < ActiveRecord::Migration[5.2]
  def change
    add_column :barrows, :latitude, :float
    add_column :barrows, :longitude, :float
  end
end
