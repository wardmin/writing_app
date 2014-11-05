class RegistrationsController < Devise::RegistrationsController
	# prepend_before_filter :require_no_authentication, only: [ :new, :create, :cancel ]
  	protected

	def after_sign_up_path_for(resource)
		home_index_path
	end

	def after_inactive_sign_up_path_for(resource)
		home_index_path
	end
end