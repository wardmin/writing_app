class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :projects
	has_many :entries, through: :projects

	def type_is
		if genre_id
			type_of_writer = Genre.find_by id: genre_id
			type_of_writer.name
		end
	end

	def am_writing?
			times_written = entries.where(created_at: (Time.now.midnight - desired_interval.day)..Time.now.midnight).length
			
			if times_written >= desired_amount
				writing = true
			else
				writing = false
			end
		writing
	end
	def total_time_writing
		if entries
		 entries.sum("duration")
		end
	end
end
