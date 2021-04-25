class CreateCryptids < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptids do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
