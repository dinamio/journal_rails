class Lesson < ActiveRecord::Base
  belongs_to :class_journal
  has_many :marks, :dependent => :destroy
end
