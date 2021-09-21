class TasksController < ActionController::Base

    def index
        @tasks = Task.all.order(created_at: :desc)
    end

    def show
        @task = Task.find_by(id: params[:id])
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def create
        @task = Task.new(content: params[:content])
        if @task.content
            @task.save
            redirect_to("/tasks/index")
        else
            render("tasks/index")
        end
    end

    def update
        @task = Task.find_by(id: params[:id])
        @task.content = params[:content]
        if @task.content
            @task.save
            redirect_to("/tasks/index")
        else
            render("tasks/#{params[:id]}/edit")
        end
    end

    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy
        redirect_to("/tasks/index")
    end

    def check
        @task = Task.find_by(id: params[:id])
        @task.finish = params[:finish]
        @task.save
        redirect_to("/tasks/index")
    end
    
end