class Addtruetosightings < ActiveRecord::Migration[6.1]
  def change
    change_column :sightings, :created_at, true 
  end
end
