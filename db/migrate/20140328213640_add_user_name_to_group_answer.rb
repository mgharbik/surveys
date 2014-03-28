class AddUserNameToGroupAnswer < ActiveRecord::Migration
  def change
  		remove_column :rapidfire_answers, :username
  	  	add_column :rapidfire_answer_groups, :username, :string
  end
end
