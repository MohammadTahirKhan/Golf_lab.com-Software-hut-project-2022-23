class AddTerrainTypeToData < ActiveRecord::Migration[7.0]
  def change
    add_column :data, :terrain_type, :integer
  end
end
