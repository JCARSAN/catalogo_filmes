class AddPhotoToDirector < ActiveRecord::Migration[7.0]
  def change
    add_column :directors, :photo, :string, default:""
  end
end
