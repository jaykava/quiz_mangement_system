class AttemptAnswer < ApplicationRecord
  belongs_to :quiz_attempt
  belongs_to :question
  belongs_to :option, optional: true

  before_save :check_correctness

  private

  def check_correctness
    if question.question_type == "matching"
      # For matching questions, answer_text contains JSON of matches
      self.correct = validate_matching_answer
    elsif option.present?
      self.correct = option.correct
    else
      self.correct = false
    end
  end

  def validate_matching_answer
    return false unless answer_text.present?

    begin
      matches = JSON.parse(answer_text)
      correct_matches = question.options.where(correct: true).pluck(:id, :match_key).to_h

      matches.all? { |match| correct_matches[match["option_id"].to_i] == match["match_key"] }
    rescue JSON::ParserError
      false
    end
  end
end
