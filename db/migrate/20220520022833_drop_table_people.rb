# frozen_string_literal: true

class DropTablePeople < ActiveRecord::Migration[7.0]
  def up
    drop_table :people
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
