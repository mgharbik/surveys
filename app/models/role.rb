class Role < ActiveRecord::Base
	has_and_belongs_to_many :question_groups

	validates :name, presence: true
end
