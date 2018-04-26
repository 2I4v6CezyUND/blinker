class CreateModelVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :model_variants do |t|
      t.references :model, foreign_key: true
      t.string :name
      t.date :year
      t.integer :starting_price_cents
      t.jsonb :features

      t.timestamps
    end
  end
end
