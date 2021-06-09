class SetDefaultForBodyColumnOnAnswer < ActiveRecord::Migration[6.1]
  def change
    change_column_default :answers, :body, 'New Answer'
  end
end
