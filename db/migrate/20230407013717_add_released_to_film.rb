class AddReleasedToFilm < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :released, :boolean, default: false
  end
end
