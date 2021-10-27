class TasksController < ApplicationController
    before_action :authenticate_user!, only:[:show, :edit, :create, :update, :destroy]
    before_action :current_task, only:[:show, :edit, :update, :destroy, :check]
    before_action :tasks_all, only:[:index, :edit, :show, :create]
    before_action :user_id_wrong, only:[:edit, :update, :destroy]

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
          flash[:alert]="ユーザーID不一致"
          redirect_to("/tasks/index")
        end
    end

end