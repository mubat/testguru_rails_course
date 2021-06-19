class AddCreatedByToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :created_by, :bigint, null: false
    add_foreign_key :tests, :users, column: :created_by
  end
end
