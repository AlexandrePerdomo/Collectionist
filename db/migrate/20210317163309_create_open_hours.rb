# frozen_string_literal: true

class CreateOpenHours < ActiveRecord::Migration[6.1]
  def change
    create_table :open_hours do |t|
      t.references :shop
      t.integer :day
      t.time :closes
      t.time :opens

      t.timestamps
    end
  end
end
