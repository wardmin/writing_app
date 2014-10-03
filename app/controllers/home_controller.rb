class HomeController < ApplicationController
  def index
  	  	@project = if current_user.projects
        	current_user.projects.order('updated_at DESC').first
        else
        	redirect_to new_project_path, alert: "You don't have any projects at the moment. Let's make one."
        end
     @goal = if @project.goals.last
     	 	@project.goals.last
     	else
     		redirect_to new_project_goal_path(@project), alert: "You don't have any goals on this project at the moment. Let's make one."
     	end
     @entry = Entry.new
  end
end
