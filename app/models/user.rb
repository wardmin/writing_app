class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :projects
	has_many :entries, through: :projects
	has_many :goals, through: :projects

	def type_is
		if genre_id
			type_of_writer = Genre.find_by id: genre_id
			type_of_writer.name
		end
	end

	def am_writing?
		if !entries.empty?
			if track_hours == true
				seconds_written = entries.where(created_at: (Time.now.end_of_day - desired_interval.day)..Time.now.end_of_day).sum("duration")
					if seconds_written < 3600 
						hours_written = 0
					else 
						hours_written = ChronicDuration.output(seconds_written, :limit_to_hours => true, :format => :short).to_i
					end

					if hours_written >= desired_amount
						writing = true
					else
						writing = false
					end
			else
				times_written = entries.where(created_at: (Time.now.midnight - desired_interval.day)..Time.now.midnight).length
				
				if times_written >= desired_amount
					writing = true
				else
					writing = false
				end
			end
		else
			writing = true
		end
		writing
	end

	def desired_timeframe
		if desired_interval
			if desired_interval == 1
				return "day"
			elsif desired_interval == 7
				return "week"
			elsif desired_interval == 30
				return "month"
			end
		else
			return "undetermined"
		end		
	end

	def total_time_writing_this_week
		if !entries.empty?
			seconds_written = entries.where(created_at: (Time.now.end_of_day - 1.week)..Time.now.end_of_day).sum("duration")

			if seconds_written < 3600 
				hours_written = "less than 1 hour"
			else 
				amount = ChronicDuration.output(seconds_written, :limit_to_hours => true, :format => :short).to_i
				hours_written = "#{amount} hours"
			end
		end
		hours_written
	end

	def total_time_writing
		if entries
		 entries.sum("duration")
		end
	end

	def hours_or_times
		if track_hours == true
			metric = "hours"
		else
			metric = "times"
		end
	end

	def most_recent_goal
		if !projects.empty?
			if !entries.empty?
				most_recent_entry = entries.order('created_at').last
				most_recent_goal = goals.order('created_at').last

				if most_recent_entry.created_at > most_recent_goal.created_at
					latest_goal = most_recent_entry.goal
				else
					latest_goal = most_recent_goal
				end
			end
			latest_goal = goals.order('created_at').last
		end
		latest_goal
	end

	def spark_line
		last_week = entries.order('created_at').last(7)
		array = []
		last_week.map do |entry|
			array << ChronicDuration.parse(entry.duration)
		end
		array.join(', ')
	end
end
