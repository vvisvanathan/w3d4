class ChangeMoreSchemeThingsForSetup < ActiveRecord::Migration
  def change
    add_column :questions, :poll_id, :integer
    add_column :answer_choices, :question_id, :integer
    remove_column :responses, :text
    add_column :responses, :answer_choice_id, :integer
  end
end
