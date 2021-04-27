class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.string :location
      t.text :account
      t.belongs_to :cryptid 
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
