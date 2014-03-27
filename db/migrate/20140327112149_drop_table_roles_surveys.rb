class DropTableRolesSurveys < ActiveRecord::Migration
  def change
  	drop_table :roles_surveys
  end
end
