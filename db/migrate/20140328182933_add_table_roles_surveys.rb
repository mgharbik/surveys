class AddTableRolesSurveys < ActiveRecord::Migration
  def change
  	create_table :rapidfire_question_groups_roles do |t|
    	t.references :role
      	t.references :question_group
    end
  end
end
