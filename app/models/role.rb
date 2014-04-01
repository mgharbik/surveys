class Role < ActiveRecord::Base
	has_and_belongs_to_many :question_groups, :class_name => "Rapidfire::QuestionGroup"

	validates :name, presence: true
end
