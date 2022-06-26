# frozen_string_literal: true

class CreateFatherOccupations < ActiveRecord::Migration[7.0]
  def change
    create_table :father_occupations, id: :string do |t|
      t.string :description
    end
  end
end
