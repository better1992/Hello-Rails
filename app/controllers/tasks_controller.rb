class TasksController < ApplicationController
	def index
  		@task = Task.new
  		@tasks = Task.all
	end

	def create
		Task.create task_params
		redirect_to :back
	end

	def edit
		@task = Task.find params.require(:id)
	end

	def update
		task = Task.find params.require(:id)
		if task.update_attributes params.require(:task).permit(:task)
			redirect_to tasks_path, :notice => 'Your task has successfully been updated'
		else
			redirect_to :back, :notice => 'There was a error updating your task'
		end
	end

	def destroy
		Task.destroy params.require(:id)
		redirect_to :back, :notice => 'Your task is removed.'
	end

	private

	def task_params
    	params.require(:task).permit(:task)
  	end
end
