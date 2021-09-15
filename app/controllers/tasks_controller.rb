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

    def new
        @task = Task.new(content: params[:content])
        if @task.save
            redirect_to("/tasks/index")
        else
            render("tasks/index")
        end
    end

    def edit_submit
        @task = Task.find_by(id: params[:id])
        @task.content = params[:content]
        if @task.save
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

end