class TasksController < ApplicationController
    before_action :current_task, only:[:show, :edit, :update, :destroy, :check]
    before_action :date_time, only:[:index, :edit, :show, :create]
    before_action :tasks_all, only:[:index, :edit, :show, :create]

    def index
    end

    def show
    end

    def edit
    end

    def create
        @task = Task.new(content: params[:content],start_time: params[:start_time])
        task_valid
    end

    def update
        @task.content = params[:content]
        @task.start_time = params[:start_time]
        @task.finish = params[:finish]
        task_valid
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

    def date_time
        @date = Date.today
    end

    def tasks_all
        @tasks = Task.all.order(created_at: :desc)
    end

    def task_valid
        if @task.valid?
            @task.save
            flash[:notice]="タスクを保存しました"
            redirect_to("/tasks/index")
        else
            flash[:alert]="#{@task.errors.full_messages}"
            redirect_back(fallback_location: root_path)
        end
    end

end