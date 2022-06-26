# frozen_string_literal: true

class CreateEducationJaTotalYears < ActiveRecord::Migration[7.0]
  def change
    create_table :education_ja_total_years, id: :string do |t|
      t.integer :years, index: true
    end
  end
end
