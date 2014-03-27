class CreateRolesEncuestas < ActiveRecord::Migration
  def change
    create_table :roles_surveys do |t|
    	t.references :role
      	t.references :question_group
    end
  end
end
