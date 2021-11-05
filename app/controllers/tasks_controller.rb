class TasksController < ApplicationController
    before_action :set_current_user, only:[:index, :edit, :show, :create, :update, :destroy]
    before_action :current_task, only:[:show, :edit, :update, :destroy, :check, :show_check]
    before_action :tasks_all, only:[:index, :edit, :show, :create]
    before_action :user_id_wrong, only:[:edit, :update, :destroy]
    before_action :show_check, only:[:show]
    before_action :date_time, only:[:index, :edit, :show, :create]

    def index
    end

    def show
    end

    def edit
    end

    def create
        @task = Task.new(content: params[:content],start_time: params[:start_time],user_id: @user.id,team_id: params[:team_id])
        save_valid_task
        redirect_back(fallback_location: root_path)
    end

    def update
        @task.content = params[:content]
        @task.start_time = params[:start_time]
        @task.finish = params[:finish]
        save_valid_task
        redirect_to("/tasks/index")
    end

    def destroy
        @task.destroy
        flash[:notice]="タスクを削除しました"
        redirect_to("/tasks/index")
    end

    private

    def current_task
        @task = Task.find_by(id: params[:id])
    end

    def tasks_all
        @tasks = Task.all.order(created_at: :desc)
    end

    def save_valid_task
        if @task.valid?(:add_task)
            @task.save
            flash[:notice]="タスクを保存しました"
        else
            flash[:alert]="#{@task.errors.full_messages}"
        end
    end

    def user_id_wrong
        if @user.id != @task.user_id
          flash[:alert]="ユーザーIDが一致しませんでした"
          redirect_to("/tasks/index")
        end
    end

    def show_check
        @team_user = TeamUser.where(team_id: @task.team_id)
        if @team_user.find_by(user_id: @user.id).blank? && @user.id != @task.user_id
            flash[:alert]="このタスクが共有されたチームに所属していません"
            redirect_to("/tasks/index")
        end
    end

end