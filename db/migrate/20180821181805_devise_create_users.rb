# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'

    create_table :users do |t|
      t.string :email,  null: false
      t.string :uuid,   null: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :uuid, unique: true
  end
end
