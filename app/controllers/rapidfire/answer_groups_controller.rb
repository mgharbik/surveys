module Rapidfire
  class AnswerGroupsController < Rapidfire::ApplicationController
    before_filter :find_question_group!

    before_action :authorize_only_voter!
    #before_action :authorize_both_admin_and_voter!

    def new
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
    end

    def create
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)

      if @answer_group_builder.save
        redirect_to question_groups_path, notice: 'Answer was created successfully'
      else
        render :new
      end
    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def answer_group_params
      answer_params = { params: params[:answer_group] }
      answer_params.merge(user: current_user, question_group: @question_group)
    end
  end
end
