class AddStatusToFilm < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :status, :integer, default:0
  end
end
