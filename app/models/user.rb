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
			times_written = entries.where(created_at: (Time.now.midnight - desired_interval.day)..Time.now.midnight).length
			
				if times_written >= desired_amount
					writing = true
				else
					writing = false
				end
		else
			writing = true
		end
		writing
	end

	def total_time_writing
		if entries
		 entries.sum("duration")
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
