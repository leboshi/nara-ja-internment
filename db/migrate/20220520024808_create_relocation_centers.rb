# frozen_string_literal: true

class CreateRelocationCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :relocation_centers, id: :string do |t|
      t.string :name, null: false, index: true
    end
  end
end
