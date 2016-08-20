module ApplicationHelper

	def is_admin_role
		current_user.role.name == 'admin'
	end

	def is_parent_role
		current_user.role.name == 'parent'
	end
end
