class AddCreatedByToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :created_by, foreign_key: { to_table: :users }
  end
end
