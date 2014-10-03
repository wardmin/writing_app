class EntriesController < ApplicationController
	before_action :set_entry, only: [:show, :edit, :update, :destroy]

	def create
		@entry = Entry.new(entry_params)
		#goa = @entry.goal_id
		@goal = Goal.find(@entry.goal_id)
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
		@project = Project.find(params[:project_id])
	end

	def show
	end

	def edit
		@goal = Goal.find(@entry.goal_id)
	end

	def update
		respond_to do |format|
			if @entry.update(entry_params)
				format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@entry.destroy 
		redirect_to goal_url(@entry.goal), :flash => { :success => "Project destroyed." }
	end

	private
	def set_entry
		 @entry = Entry.find(params[:id])
	end
	def entry_params
		params.require(:entry).permit(:name, :intention, :total_time, :goal_id, :journal, :amount_done, :time_started)
	end
end
