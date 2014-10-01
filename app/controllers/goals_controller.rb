class GoalsController < ApplicationController
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
end
