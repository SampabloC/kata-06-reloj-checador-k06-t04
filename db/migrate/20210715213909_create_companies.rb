class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name_company
      t.string :address
      t.belongs_to :administrator, foreign_key: true
      
      t.timestamps
    end
  end
end
