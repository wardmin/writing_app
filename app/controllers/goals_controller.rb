class GoalsController < ApplicationController
	before_action :set_goal, only: [:show, :edit, :update, :destroy]

	def index
		@goals = Project.find(params[:project_id]).goals
		@project = Project.find(params[:project_id])
			if @project.user_id != current_user.id 
	        	redirect_to home_index_path
	      	end
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
		# @goal.deadline_check
		 if @goal.update(goal_params)
		 	redirect_to goal_path
		 else
		 	render :edit
		 end
	end

	private
	def goal_params
		params.require(:goal).permit(:name, :goal_type_id, :amount_done, :deadline, :metric_id, :metric_target, :metric_name, :project_id)
	end

	def set_goal
      @goal = Goal.find(params[:id])
       if @goal.user_id != current_user.id 
        redirect_to home_index_path
      end
    end
end
