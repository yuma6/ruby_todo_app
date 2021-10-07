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
        if @task.content=="" && @task.start_time==nil
            flash[:alert]="タスクと日付が入力されていません"
            redirect_to("/tasks/index")
        elsif @task.content==""
            flash[:alert]="タスクが入力されていません"
            redirect_to("/tasks/index")
        elsif @task.start_time==nil
            flash[:alert]="日付が指定されていません"
            redirect_to("/tasks/index")
        else
            @task.save
            flash[:notice]="タスクと日付を保存しました"
            redirect_to("/tasks/index")
        end
    end

    def update
        @task.content = params[:content]
        @task.start_time = params[:start_time]
        @task.finish = params[:finish]
        if @task.content=="" && @task.start_time==nil
            flash[:alert]="タスクと日付が入力されていません"
            redirect_to("/tasks/#{@task.id}/edit")
        elsif @task.content==""
            flash[:alert]="タスクが入力されていません"
            redirect_to("/tasks/#{@task.id}/edit")
        elsif @task.start_time==nil
            flash[:alert]="日付が指定されていません"
            redirect_to("/tasks/#{@task.id}/edit")
        else
            @task.save
            flash[:notice]="タスクの変更を保存しました"
            redirect_to("/tasks/index")
        end
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

end