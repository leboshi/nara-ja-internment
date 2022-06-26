# frozen_string_literal: true

class CreateAssemblyCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :assembly_centers, id: :string do |t|
      t.string :name, index: true, null: false
    end
  end
end
