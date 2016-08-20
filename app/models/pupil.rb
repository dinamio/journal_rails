class Pupil < ActiveRecord::Base
  belongs_to :form

  belongs_to :user

  attr_accessor :number

  def self.fill_pupils(pupils)
    number = 1
    pupils.each do |pupil|
      pupil.number = number
      number = number+1
    end
  end

  def self.find_by_id(pupil_id) 
  	pupils = Pupil.all.order(:surname)
  	fill_pupils(pupils)
  	pupils.each do |pupil|
  		if pupil.id.to_s == pupil_id
  			return pupil
  		end
  	end
  end

end
