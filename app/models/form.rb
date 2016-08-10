class Form < ActiveRecord::Base
	has_many :class_journals, :dependent => :destroy 
	has_many :subjects, through: :class_journals
	has_many :pupils, :dependent => :destroy
end
