class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,    null: false, foreign_key: true
      t.string :name,        null: false
      t.integer :price,      null: false
      t.text :description,   null: false
      t.integer :burden,     null: false
      t.integer :days,       null: false
      t.integer :prefecture, null: false
      t.integer :category,   null: false
      t.integer :condition,  null: false
      t.text :memo
      t.timestamps
    end
  end
end
