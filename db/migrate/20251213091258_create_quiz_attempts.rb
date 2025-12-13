class CreateQuizAttempts < ActiveRecord::Migration[8.1]
  def change
    create_table :quiz_attempts do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :session_id
      t.decimal :score
      t.integer :total_questions

      t.timestamps
    end
  end
end
