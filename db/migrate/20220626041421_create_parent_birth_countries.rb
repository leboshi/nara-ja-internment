# frozen_string_literal: true

class CreateParentBirthCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_birth_countries, id: :string do |t|
      t.integer :mother, null: false, index: true
      t.integer :father, null: false, index: true
    end
  end
end
