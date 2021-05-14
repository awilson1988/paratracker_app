class Addcolumntocryptids < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptids, :user_id, :integer
  end
end
