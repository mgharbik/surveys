class RenameTableQuestionGroupsRoles < ActiveRecord::Migration
  def change
  	rename_table :roles_surveys, :rapidfire_question_groups_roles
  end
end
