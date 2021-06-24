# frozen_string_literal: true

class AddUniqueForTitleInTests < ActiveRecord::Migration[6.1]
  def up
    execute 'ALTER TABLE tests ADD CONSTRAINT uniq_title_level UNIQUE (title, level)'
  end

  def down
    execute 'ALTER TABLE tests DROP CONSTRAINT uniq_title_level'
  end
end
