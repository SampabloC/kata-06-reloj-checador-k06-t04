# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.integer :employee_number
      t.string :name_employee
      t.string :email_employee
      t.string :position_employee
      t.belongs_to :administrator, foreign_key: true
      t.timestamps
    end
  end
end
