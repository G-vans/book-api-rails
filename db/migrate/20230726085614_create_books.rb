class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.text :authors
      t.integer :number_of_pages
      t.string :publisher
      t.string :country
      t.date :release_date

      t.timestamps
    end
  end
end
