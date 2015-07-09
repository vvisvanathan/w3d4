# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#

class Poll < ActiveRecord::Base
  validates :title, :author_id, :presence => true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :questions,
    class_name: 'Question',
    foreign_key: :poll_id,
    primary_key: :id
  )
end
