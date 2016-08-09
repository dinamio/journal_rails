class JournalController < ApplicationController
  def index
  	@journals = Array.new
  	forms = Form.all
  	forms.each do |form|
  		subjects = form.subjects
  		subjects.each do |subject|
  			@journals.push([form.name,subject.name])
  		end
  	end
  	respond_to do |format|
        format.html 
      end
  end

  def details
  end
end
