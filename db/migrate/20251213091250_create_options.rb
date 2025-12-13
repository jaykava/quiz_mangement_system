class CreateOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :options do |t|
      t.references :question, null: false, foreign_key: true
      t.text :content
      t.boolean :correct
      t.string :match_key

      t.timestamps
    end
  end
end
