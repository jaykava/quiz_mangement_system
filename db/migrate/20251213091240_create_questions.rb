class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :content
      t.string :question_type
      t.integer :position
      t.integer :points

      t.timestamps
    end
  end
end
