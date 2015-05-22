class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :string
      t.string :price
      t.string :integer
      t.string :detail
      t.string :text
      t.string :image

      t.timestamps null: false
    end
  end
end
