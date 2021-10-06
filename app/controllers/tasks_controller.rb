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
        if @task.content && @task.start_time
            @task.save
            redirect_to("/tasks/index")
        else
            render("tasks/index")
        end
    end

    def update
        @task.content = params[:content]
        @task.start_time = params[:start_time]
        @task.finish = params[:finish]
        @task.save
        redirect_to("/tasks/index")
    end

    def destroy
        @task.destroy
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

end