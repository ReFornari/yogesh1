class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end
