class ChangeBodyColumnOnQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :body, :string, null: false
  end
end
