class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, limit: 1
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
