class GoalsController < ApplicationController
	before_action :set_goal, only: [:show, :edit, :update, :destroy]

	def index
		@goals = Project.find(params[:project_id]).goals
		@project = Project.find(params[:project_id])
	end
	def show

	end

	def new
		@project = Project.find(params[:project_id])
		@goal = Goal.new
	end

	def create
		@goal = Goal.new(goal_params)
		@project = @goal.project_id
		if @goal.save
			redirect_to project_path(@project)
		else
			render "/projects/show"
		end
	end

	def edit	
	end

	def update
		 if @goal.update(goal_params)
		 	redirect_to goal_path
		 else
		 	render :edit
		 end
	end

	private
	def goal_params
		params.require(:goal).permit(:name, :goal_type_id, :amount, :deadline, :metric_id, :project_id)
	end

	def set_goal
      @goal = Goal.find(params[:id])
    end
end
