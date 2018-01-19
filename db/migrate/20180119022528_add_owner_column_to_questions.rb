class AddOwnerColumnToQuestions < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      ALTER TABLE questions
        ADD COLUMN user_id INTEGER NOT NULL
    SQL
  end

  def down
    execute <<~SQL
      ALTER TABLE questions
        DROP COLUMN user_id
    SQL
  end
end
