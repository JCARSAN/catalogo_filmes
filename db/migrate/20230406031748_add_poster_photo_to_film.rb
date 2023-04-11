class AddPosterPhotoToFilm < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :poster_photo, :string, default: ''
  end
end
