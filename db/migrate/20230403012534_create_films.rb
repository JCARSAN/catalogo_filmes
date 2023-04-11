class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year_published
      t.string :synopsis
      t.string :country
      t.integer :duration
      t.references :director, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
