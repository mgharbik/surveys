module Rapidfire
  class AnswerGroupsController < Rapidfire::ApplicationController
    before_filter :find_question_group!
    before_filter :was_already_voted, only: [:create]

    before_action :authorize_only_voter!
    #before_action :authorize_both_admin_and_voter!

    def new
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
    end

    def create
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
      if @answer_group_builder.save
        save_vote
        redirect_to question_groups_path, notice: 'Encuesta ha sido respondida correctamente!'
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

    def save_vote
      Voting.create(asnwer_group_id: @question_group.id, username: session[:username])
    end

    def was_already_voted
      unless Voting.find_by_asnwer_group_id_and_username(@question_group.id, session[:username]).nil?
        redirect_to main_app.root_path, alert: "No puedes votar, ya lo has votado antes!"
      end
    end
  end
end
