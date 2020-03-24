class AddLatAndLngToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :lat, :numeric
    add_column :posts, :lng, :numeric
  end
end
