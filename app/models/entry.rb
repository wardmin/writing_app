class Entry < ActiveRecord::Base
	belongs_to :goal

	def project
		if self.goal_id
			goal = Goal.find(self.goal_id)
			project = Project.find(goal.project_id)
			project
		end
	end
end
