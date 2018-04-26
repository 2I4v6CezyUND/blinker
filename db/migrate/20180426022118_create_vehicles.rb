class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :model_variant, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
