class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
