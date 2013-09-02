class AddIndexesToKarmaPoints < ActiveRecord::Migration
  def change
    add_column :karma_points, :value, :string
    add_index :karma_points, :value
    add_column :karma_points, :user_id, :string
    add_index :karma_points, :user_id
  end
end
