class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :sighting_id, :integer, null: false
  end
end
