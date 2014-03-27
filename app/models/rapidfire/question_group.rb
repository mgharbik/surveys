module Rapidfire
  class QuestionGroup < ActiveRecord::Base
    has_many :questions
 	has_and_belongs_to_many :roles
    validates :name, :presence => true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name
    end
  end
end
