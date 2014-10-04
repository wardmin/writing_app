class HomeController < ApplicationController
  def index
  	  	if !current_user.projects.empty?
        	@project = current_user.projects.order('updated_at DESC').first
          if @project.goals != nil
            @goal = @project.goals.last
            @entry = Entry.new
          else
            redirect_to new_project_goal_path(@project), alert: "You don't have any goals on this project at the moment. Let's make one."
          end          
        else
        	redirect_to new_project_path, alert: "You don't have any projects at the moment. Let's make one."
        end
  end
end
