class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :sighting_id
  end
end
