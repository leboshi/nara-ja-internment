# frozen_string_literal: true

class CreateEducationJaGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :education_ja_grades, id: :string do |t|
      t.boolean :elementary_school, index: true
      t.boolean :high_school, index: true
      t.boolean :higher_ed, index: true
    end
  end
end
