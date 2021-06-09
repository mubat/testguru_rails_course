class ChangeTitleColumnOnAnswer < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :body, :string, null: false
  end
end
