class EntriesController < ApplicationController
	def create
		@entry = Entry.new(entry_params)
		goa = @entry.goal_id
		@goal = Goal.find(goa)
		if @entry.save
			redirect_to goal_path(@goal)
		else
			render "/projects/show"
		end
	end

	def new
		@entry = Entry.new
		@entry.goal_id = params[:goal_id]
		@goal = Goal.find(params[:goal_id])
		proj = @goal.project_id
		@project = Project.find(proj)
	end
	private
	def entry_params
		params.require(:entry).permit(:name, :intention, :total_time, :goal_id)
	end
end
