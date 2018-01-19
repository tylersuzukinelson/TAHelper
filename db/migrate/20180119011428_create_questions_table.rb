class CreateQuestionsTable < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE TABLE questions (
        id BIGSERIAL PRIMARY KEY,
        body VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL
      )
    SQL
  end

  def down
    execute <<~SQL
      DROP TABLE questions
    SQL
  end
end
