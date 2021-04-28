class Addtruetosightings < ActiveRecord::Migration[6.1]
  def change
    change_column_null :sightings, :user_id, true 
  end
end
