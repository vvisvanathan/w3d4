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
  validates :text, :question_id, :presence => true

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
    :question
    through: :answer_choice,
    source: :question
  )

  def sibling_responses

  end

end
