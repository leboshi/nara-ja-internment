# frozen_string_literal: true

class CreateRelocationCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :relocation_centers, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false, index: true
    end

    add_foreign_key :coded_files, :relocation_centers
  end
end
