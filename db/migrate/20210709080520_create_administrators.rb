# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :nameAdmin
      t.string :emailAdmin
      t.string :password

      t.timestamps
    end
  end
end
