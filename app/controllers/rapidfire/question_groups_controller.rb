module Rapidfire
  class QuestionGroupsController < Rapidfire::ApplicationController
    before_action :authorize_only_administrator!, except: :index
    before_action :authorize_both_admin_and_voter!, only: :index


    respond_to :html, :js
    respond_to :json, only: :results

    def index
      if current_user
        @question_groups = QuestionGroup.all
      else
        @question_groups = Array.new
        role = Role.find_by_name(session[:role])
        unless role.nil?
          QuestionGroup.all.each do |survey|
              if survey.roles.include?(role)
                @question_groups << survey
              end
          end
        else
          flash[:alert] = "No hay ningun role #{session[:role]} en la base de datos"
        end
      end
      respond_with(@question_groups)
    end

    def new
      @question_group = QuestionGroup.new
      respond_with(@question_group)
    end

    def edit
      @question_group = QuestionGroup.find(params[:id])
      respond_with(@question_group)
    end

    def create
      @question_group = QuestionGroup.new(question_group_params)
      @question_group.save

      respond_with(@question_group, location: rapidfire.question_groups_url)
    end

    def update
      @question_group = QuestionGroup.find(params[:id])
      @question_group.update(question_group_params)

      respond_with(@question_group, location: rapidfire.question_groups_url)
    end

    def destroy
      @question_group = QuestionGroup.find(params[:id])
      @question_group.destroy

      respond_with(@question_group)
    end

    def results
      @question_group = QuestionGroup.find(params[:id])
      @question_group_results =
        QuestionGroupResults.new(question_group: @question_group).extract

      respond_with(@question_group_results, root: false)
    end

    private
    def question_group_params
      if Rails::VERSION::MAJOR == 4
        params.require(:question_group).permit(:name, :role_ids => [])
      else
        params[:question_group]
      end
    end
  end
end
