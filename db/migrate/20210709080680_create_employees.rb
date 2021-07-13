# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.integer :employeeNumber
      t.string :nameEmployee
      t.string :emailEmployee
      t.string :positionEmployee
      t.date :attendanceDate
      t.belongs_to :administrator, foreign_key: true
      t.timestamps
    end
  end
end
