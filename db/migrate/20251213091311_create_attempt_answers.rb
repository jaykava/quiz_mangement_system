class CreateAttemptAnswers < ActiveRecord::Migration[8.1]
  def change
    create_table :attempt_answers do |t|
      t.references :quiz_attempt, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.text :answer_text
      t.boolean :correct

      t.timestamps
    end
  end
end
