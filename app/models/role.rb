class Role < ActiveRecord::Base
	has_and_belongs_to_many :question_groups

	default_scope lambda { order('roles.name') }
end
