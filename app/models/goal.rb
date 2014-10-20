class Goal < ActiveRecord::Base
	has_many :entries
	belongs_to :projects
	belongs_to :goal_type
	include AASM

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

	def user_id
		project = Project.find_by id: project_id
		user_id = project.user_id
		user_id
	end

	def total_time_spent
		if entries
		 entries.sum("duration")
		end
	end

	def progress
		if entries
			done_so_far = entries.sum("amount_done")
			unless done_so_far == 0
				progress = ((done_so_far.to_f / metric_target.to_f) * 100).floor
			end
		else
			progress = 0
		end
		progress
	end

	def made_on
		created_at.localtime.strftime("%b %e, %l:%M %p")
	end

	def metric_type_is
		if metric_id
			if metric_id == 5
				metric_type = metric_name
			else
				metric_type = Metric.find_by id: metric_id
				metric_type.name
			end
		end
	end

	def spark_line
		last_week = entries.order('created_at').last(7)
		array = []
		last_week.map do |entry|
			array << ChronicDuration.parse(entry.duration)
		end
		array.join(', ')
	end

	aasm do
		state :active, :initial => true
		state :complete
		state :overdue
		state :pause
		state :archive

		event :deadline_passed do
			transitions :from => :active, :to => :overdue
		end

		event :deadline_future do
			transitions :from => :overdue, :to => :active
		end

		def deadline_passed
			if deadline
				if deadline < Date.today
					return true
				end
			end
		end

		def deadline_future
			if aasm_state = "overdue"
				if deadline > Date.today
					transitions :from => :overdue, :to => :active
				end
			end
		end
	end

end
