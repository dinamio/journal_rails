class ClassJournal < ActiveRecord::Base
  belongs_to :form
  belongs_to :subject
  has_many :lessons, :dependent => :destroy
end
