class EntriesController < ApplicationController
	before_action :set_entry, only: [:show, :edit, :update, :destroy]

	def create
		@entry = Entry.new(entry_params)
		@goal = Goal.find(@entry.goal_id)
		if @entry.save
			redirect_to edit_entry_path(@entry)
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
			# Rails.logger.info "In update action"

			if params[:entry][:duration].present?
				# Rails.logger.info "Params duration not nil"

				params[:entry][:duration] = ChronicDuration::parse(params[:entry][:duration])
				# Rails.logger.info "Params for time => #{params}"
			end
		respond_to do |format|
	
			if @entry.update(entry_params)
				format.html { redirect_to @entry, :flash => { success: 'Entry was successfully updated.' } }
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@entry.destroy 
		redirect_to goal_url(@entry.goal), :flash => { :notice => "Project destroyed." }
	end

	private
	def set_entry
		 @entry = Entry.find(params[:id])
		 if @entry.project.user_id != current_user.id 
        	redirect_to home_index_path
      	end
	end
	def entry_params
		params.require(:entry).permit(:name, :intention, :duration, :goal_id, :journal, :amount_done, :time_started)
	end
end
