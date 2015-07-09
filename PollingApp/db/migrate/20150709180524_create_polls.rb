class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :title, null: false
      t.text :author, null: false
      t.timestamps null: false
    end

    add_index :polls, :title
  end
end
