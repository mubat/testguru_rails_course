class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :filename
      t.string :rule, null: false

      t.timestamps
    end
  end
end
