class AddQuestionForeignKeyToTests < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :questions, :tests
    add_foreign_key :questions, :tests, on_delete: :cascade
  end
end
