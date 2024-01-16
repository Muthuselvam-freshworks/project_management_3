class TodosController < ApplicationController
    
      #handling the status while dropping tasks in every column
      def move_todo
        @todo = Task.find(params[:id])
        @todo.update(status: params[:status])
        head :ok
      end

end
  