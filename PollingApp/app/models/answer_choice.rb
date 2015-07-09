# == Schema Information
#
# Table name: answer_choices
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerChoice < ActiveRecord::Base
end
