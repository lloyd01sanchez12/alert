# frozen_string_literal: true

class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :message
      t.timestamps
    end
  end
end
