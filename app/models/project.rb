class Project < ActiveRecord::Base
	has_many :goals
	belongs_to :user
	belongs_to :project_type

	def type_is
		if project_type
			project_type = ProjectType.find_by id: project_type_id
			project_type.name
		end
	end
end
