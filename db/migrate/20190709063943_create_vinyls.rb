class CreateVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :vinyls do |t|
      t.string :artist
      t.string :genre
      t.string :name
      t.date :year
      t.float :price
      t.text :description
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
