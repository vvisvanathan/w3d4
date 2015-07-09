# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  author     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ActiveRecord::Base
end
