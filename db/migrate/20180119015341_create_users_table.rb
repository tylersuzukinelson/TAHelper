class CreateUsersTable < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE TABLE users (
        id BIGSERIAL PRIMARY KEY,
        email VARCHAR(255) NOT NULL,
        permissions INTEGER NOT NULL,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL
      )
    SQL
  end

  def down
    execute <<~SQL
      DROP TABLE users
    SQL
  end
end
