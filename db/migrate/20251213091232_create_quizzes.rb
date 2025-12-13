class CreateQuizzes < ActiveRecord::Migration[8.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.boolean :published, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :quizzes, :published
  end
end
