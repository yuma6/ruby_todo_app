class TaskController < ActionController::Base

    def index
        @task = Task.all.order(created_at: :desc)
    end

    def show
        @task = Task.find_by(id: params[:id])
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

end