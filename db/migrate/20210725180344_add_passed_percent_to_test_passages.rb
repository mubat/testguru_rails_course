class AddPassedPercentToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :passed_percent, :integer, default: nil
  end
end
