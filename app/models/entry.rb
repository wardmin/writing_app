class Entry < ActiveRecord::Base
	belongs_to :goal
	extend SimpleCalendar
	has_calendar :attribute => :created_at

	def project
		if self.goal_id
			goal = Goal.find(self.goal_id)
			project = Project.find(goal.project_id)
			project
		end
	end
	def journal?
		if journal
			if journal == ""
				journaled =  10008
			else
				journaled = 10004
			end
		end
		journaled
	end

	def duration
		ChronicDuration.output(read_attribute(:duration), format: :short)
	end

	def made_on
		created_at.localtime.strftime("%b %e, %l:%M %p")
	end

	def duration_long
		ChronicDuration.output(read_attribute(:duration), format: :long, :units => 2)
	end

end
