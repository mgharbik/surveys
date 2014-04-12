class AddTypeToRapidfireQuestionGroups < ActiveRecord::Migration
  def change
  	add_column :rapidfire_question_groups, :survey_type, :string
  end
end
