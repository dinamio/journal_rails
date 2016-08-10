class Subject < ActiveRecord::Base
	has_many :class_journals, :dependent => :destroy
	has_many :forms, through: :class_journals
	
end
