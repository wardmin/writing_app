class Goal < ActiveRecord::Base
	has_many :entries, :dependent => :destroy
	belongs_to :projects
	belongs_to :goal_type
	# include AASM
	extend SimpleCalendar
  	has_calendar :attribute => :deadline

	def type_is
		if goal_type
			if goal_type_id == 4 
				type_is = "writing #{draft_number.ordinalize} draft"
			else
				goal_type = GoalType.find_by id: goal_type_id
				type_is = goal_type.name
			end
			type_is
		end
	end

	def type_is_dashboard
		if goal_type
			if goal_type_id == 4 
				type_is = "writing the #{draft_number.ordinalize} draft of"
			else
				goal_type = GoalType.find_by id: goal_type_id
				type_is = goal_type.name
			end
			type_is
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
			progress = 1
		end
		if progress == nil
			progress = 0
		elsif progress >= 101
			progress = 101
		end
		progress
	end

	def metrics_progress
		if entries
			done_so_far = entries.sum("amount_done")
		else
			done_so_far = 1
		end
		done_so_far
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
	
	# aasm do
	# 	state :active, :initial => true
	# 	state :paused
	# 	state :completed
	# 	state :archived

	# 	# event :deadline_passed do
	# 	# 	transitions :from => [:overdue, :active], :to => :overdue
	# 	# end

	# 	# event :deadline_future do
	# 	# 	transitions :from => [:overdue, :archive, :active], :to => :active
	# 	# end
	# end

	# def deadline_check
	# 	if deadline
	# 		if deadline > Date.today
	# 			deadline_passed
	# 		elsif deadline < Date.today
	# 			deadline_future
	# 		end
	# 	end
	# end

end
