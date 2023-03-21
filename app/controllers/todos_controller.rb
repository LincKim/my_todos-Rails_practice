class TodosController < ApplicationController

    def get_todos 
        email = session[:email]
        if email
        render json: Todo.all 
        else 
            render json: { message: "Not authorized" }, status: 401
        end

    end

    def create 
        title = todo_params[:title]
        description = todo_params[:description]
        priority = todo_params[:priority]

        user = cookies[:email]

        if user 
        # add todo in DB
        todo = Todo.create(title: title, description: description, priority: priority)
       
        render json: todo
    end

    def update 

        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)
        render json: { message: "Updated Todo successfully" }

    end

    def delete 
        id = params[:id]
        todo = Todo.find(id)
        todo.destroy
        render json: { message: "deleted successfully" }
    end

    private 

    def todo_params 
        params.permit(:title, :description, :priority)
    end
end
