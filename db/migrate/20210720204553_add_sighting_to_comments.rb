class AddSightingToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :sighting, foreign_key: true, index: true
  end
end
