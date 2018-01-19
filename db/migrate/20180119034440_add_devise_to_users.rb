# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      ALTER TABLE users
        ADD COLUMN encrypted_password VARCHAR(255) NOT NULL,
        ADD COLUMN reset_password_token VARCHAR(255),
        ADD COLUMN reset_password_sent_at TIMESTAMP,
        ADD COLUMN remember_created_at TIMESTAMP,
        ADD COLUMN sign_in_count INTEGER NOT NULL DEFAULT 0,
        ADD COLUMN current_sign_in_at TIMESTAMP,
        ADD COLUMN last_sign_in_at TIMESTAMP,
        ADD COLUMN current_sign_in_ip INET,
        ADD COLUMN last_sign_in_ip INET;
      CREATE UNIQUE INDEX users_email
        ON users(email);
      CREATE UNIQUE INDEX users_reset_password_token
        ON users(reset_password_token);
    SQL
  end

  def down
    execute <<~SQL
      DROP INDEX users_email;
      DROP INDEX users_reset_password_token;
      ALTER TABLE users
        DROP COLUMN encrypted_password,
        DROP COLUMN reset_password_token,
        DROP COLUMN reset_password_sent_at,
        DROP COLUMN remember_created_at,
        DROP COLUMN sign_in_count,
        DROP COLUMN current_sign_in_at,
        DROP COLUMN last_sign_in_at,
        DROP COLUMN current_sign_in_ip,
        DROP COLUMN last_sign_in_ip;
    SQL
  end
end
