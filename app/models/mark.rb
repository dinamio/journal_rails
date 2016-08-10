class Mark < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :pupil
end
