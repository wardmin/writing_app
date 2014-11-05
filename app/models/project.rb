class Project < ActiveRecord::Base
	has_many :goals, :dependent => :destroy
	has_many :entries, through: :goals, :dependent => :destroy
	belongs_to :user
	belongs_to :project_type
	accepts_nested_attributes_for :goals
	accepts_nested_attributes_for :entries
	include AASM
	extend SimpleCalendar
  	has_calendar :attribute => :deadline


	def type_is
			project_type = ProjectType.find_by id: project_type_id
			project_type.name
	end

	def most_recent_entry
		if !entries.empty?
			entries.order('created_at').last
		end
	end

	def most_recent_goal
		most_recently_created_goal = goals.order('created_at').last
		if !entries.empty?
			most_recent_entry = entries.order('created_at').last

			if most_recent_entry.created_at > most_recently_created_goal.created_at
				latest_goal = most_recent_entry.goal
			else
				latest_goal = most_recently_created_goal
			end
		end
		latest_goal
	end

	def total_time_spent
		if entries
		 entries.sum("duration")
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
		state :paused
		state :completed
		state :archived

		# event :deadline_passed do
		# 	transitions :from => [:overdue, :active], :to => :overdue
		# end

		# event :deadline_future do
		# 	transitions :from => [:overdue, :archive, :active], :to => :active
		# end

	end

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
