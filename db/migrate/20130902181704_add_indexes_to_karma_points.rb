class AddIndexesToKarmaPoints < ActiveRecord::Migration
  def change
    add_index :karma_points, :value
    add_index :karma_points, :user_id
  end
end
