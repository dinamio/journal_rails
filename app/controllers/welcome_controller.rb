class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
  		if current_user.admin?
  			redirect_to forms_path
  		else
  			redirect_to parents_path
  		end
  	else
  		redirect_to new_user_session_path
  	end
  end
end
