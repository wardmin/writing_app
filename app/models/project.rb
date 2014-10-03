class Project < ActiveRecord::Base
	has_many :goals
	has_many :entries, through: :goals
	belongs_to :user
	belongs_to :project_type
	accepts_nested_attributes_for :goals
	accepts_nested_attributes_for :entries


	def type_is
			project_type = ProjectType.find_by id: project_type_id
			project_type.name
	end

	def most_recent_goal
		if !goals.empty?
			goals.last
		end
	end

	def total_time_spent
		if entries
		 entries.sum("total_time")
		end
	end
end
