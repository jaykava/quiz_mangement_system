class ChangeOptionIdToNullableInAttemptAnswers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :attempt_answers, :option_id, true
  end
end
