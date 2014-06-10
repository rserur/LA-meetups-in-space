class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.string :title
      table.string :body, null:false
      table.integer :user_id, null:false
      table.integer :meetup_id, null:false

      table.timestamps
    end
  end
end
