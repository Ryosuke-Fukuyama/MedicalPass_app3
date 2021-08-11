# frozen_string_literal: true

class DeviseCreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      ## Database authenticatable
      t.string  :name,               null: false, default: ""
      t.string  :email,              null: false, default: ""
      t.string  :encrypted_password, null: false, default: ""
      t.integer :tel,                default: ""
      t.string  :address,            default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :patients, :name
    add_index :patients, :email,                unique: true
    add_index :patients, :reset_password_token, unique: true
    add_index :patients, :confirmation_token,   unique: true
    add_index :patients, :unlock_token,         unique: true
  end
end
