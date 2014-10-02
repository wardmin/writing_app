class GoalsController < ApplicationController
	before_action :set_goal, only: [:show, :edit, :update, :destroy]

	def show

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

	private
	def goal_params
		params.require(:goal).permit(:name, :goal_type_id, :amount, :deadline, :metric_id, :project_id)
	end

	def set_goal
      @goal = Goal.find(params[:id])
    end
end
