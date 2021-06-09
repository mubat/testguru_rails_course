class ChangeTitleColumnOnTests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tests, :title, 'New Test'
  end
end
