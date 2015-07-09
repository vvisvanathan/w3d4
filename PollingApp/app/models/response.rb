# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  respondent_id    :integer          not null
#  answer_choice_id :integer
#

class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, :presence => true
  validates :answer_choice_id, uniqueness: { scope: :respondent_id }
  validate :respondent_has_not_already_answered_question

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :respondent_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    question.responses.where(':id IS NULL OR responses.id != :id', id: self.id)
  end

  def respondent_has_not_already_answered_question
    if sibling_responses.exists?(:respondent_id => self.respondent_id)
      errors[:respondent_id] << "has already answered this question"
    end
  end

end
