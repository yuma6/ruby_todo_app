class PostController < ActionController::Base

    def new
        @post = Task.new(content: params[:content])
        if @post.save
            redirect_to("/task/index")
        else
            render("task/index")
        end
    end

    def edit
        @post = Task.find_by(id: params[:id])
        @post.content = params[:content]
        @post.save
        redirect_to("/task/index")
    end

    def destroy
        @post = Task.find_by(id: params[:id])
        @post.destroy
        redirect_to("/task/index")
    end
end