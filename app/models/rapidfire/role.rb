module Rapidfire
	class Rapidfire::Role < ActiveRecord::Base
		has_and_belongs_to_many :question_groups
	end
end