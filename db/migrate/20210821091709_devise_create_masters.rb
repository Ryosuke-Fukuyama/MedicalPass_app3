# frozen_string_literal: true

class DeviseCreateMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :masters do |t|
      t.string :encrypted_password, null: false, default: ""

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end
  end
end
