class Goal < ActiveRecord::Base
	has_many :entries
	belongs_to :projects
	belongs_to :goal_type

	def type_is
		if goal_type
			goal_type = GoalType.find_by id: goal_type_id
			goal_type.name
		end
	end

	def project_name
			project = Project.find_by id: project_id
			project.name
	end

	def project
		project = Project.find_by id: project_id
		project
	end

	def total_time_spent
		if entries
		 entries.sum("duration")
		end
	end

	def made_on
		created_at.localtime.strftime("%b %e, %l:%M %p")
	end
end
