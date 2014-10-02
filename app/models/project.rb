class Project < ActiveRecord::Base
	has_many :goals
	has_many :entries, through: :goals
	belongs_to :user
	belongs_to :project_type
	accepts_nested_attributes_for :goals
	accepts_nested_attributes_for :entries


	def type_is
		if project_type
			project_type = ProjectType.find_by id: project_type_id
			project_type.name
		end
	end
end
