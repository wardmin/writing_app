class GoalsController < ApplicationController
	before_action :set_goal, only: [:show, :edit, :update, :destroy, :calendar, :list]
	

	def index
		@goals = Project.find(params[:project_id]).goals
		@project = Project.find(params[:project_id])
		render layout: "goals_index"
			if @project.user_id != current_user.id 
	        	redirect_to home_index_path
	      	end
	end
	def show
		# respond_to do |format|
		# 	format.html
		# 	format.js 
		# end
	end
	def calendar
		respond_to do |format|
			format.js
		end
	end
	def list
		respond_to do |format|
			format.js
		end
	end
	def new
		@project = Project.find(params[:project_id])
		@goal = Goal.new
		render layout: "goals_new"
	end

	def create
		@goal = Goal.new(goal_params)
		@project = @goal.project_id
		if @goal.save
			redirect_to goal_path(@goal)
		else
			render "/projects/show"
		end
	end

	def edit	
	end

	def update
		# @goal.deadline_check
		 if @goal.update(goal_params)
		 	flash[:success] = "Goal was successfully updated!"
		 	redirect_to goal_path
		 else
		 	render :edit
		 end
	end


	def destroy
		@goal.destroy 
		redirect_to project_goals_path(@goal.project), :flash => { :notice => "Goal successfully deleted." }
	end

	private
	def goal_params
		params.require(:goal).permit(:name, :goal_type_id, :amount_done, :deadline, :metric_id, :metric_target, :metric_name, :project_id, :draft_number)
	end

	def set_goal
      @goal = Goal.find(params[:id])
       if @goal.user_id != current_user.id 
        redirect_to home_index_path
      end
    end
end
