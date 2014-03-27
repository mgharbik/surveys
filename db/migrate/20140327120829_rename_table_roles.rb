class RenameTableRoles < ActiveRecord::Migration
  def change
  	rename_table :roles, :rapidfire_roles
  end
end
