class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
