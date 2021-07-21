class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.belongs_to :employee, foreign_key: true
      



      t.timestamps
    end
  end
end
