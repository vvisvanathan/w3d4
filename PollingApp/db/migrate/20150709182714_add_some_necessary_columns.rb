class AddSomeNecessaryColumns < ActiveRecord::Migration
  def change
    remove_column :polls, :author
    add_column :polls, :author_id, :integer, null: false
    add_column :responses, :respondent_id, :integer, null: false
  end
end
