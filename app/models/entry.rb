class Entry < ActiveRecord::Base
	belongs_to :goal
	# attr_accessor :duration

	def project
		if self.goal_id
			goal = Goal.find(self.goal_id)
			project = Project.find(goal.project_id)
			project
		end
	end

	# def before_save
	# 	duaration = ChronicDuration::parse(duration_before_type_cast) if attribute_present?("duration")
	# end

	# def duration
	# 	ChronicDuration.output(read_attribute(:duration), :format => :long)
	# end
end
