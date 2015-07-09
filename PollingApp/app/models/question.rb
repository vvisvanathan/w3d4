# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, :presence => true

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    answers = answer_choices.includes(:responses)

    answer_hash = Hash.new
    answers.each do |answer|
      answer_hash[answer.text] = answer.responses.count
    end
    answer_hash
  end

end
