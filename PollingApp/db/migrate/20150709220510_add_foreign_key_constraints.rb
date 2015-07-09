class AddForeignKeyConstraints < ActiveRecord::Migration
  def change
    add_foreign_key :polls, :users, column: :author_id
    add_foreign_key :questions, :polls
    add_foreign_key :answer_choices, :questions
    add_foreign_key :responses, :answer_choices
    add_foreign_key :responses, :users, column: :respondent_id
  end
end
