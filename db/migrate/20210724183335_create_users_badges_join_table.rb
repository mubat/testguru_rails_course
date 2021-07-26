class CreateUsersBadgesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :badges do |t|
      t.index [:user_id]
      t.index %i[user_id badge_id]
    end
  end
end
