class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable

  belongs_to :role         

  attr_accessor :unhashed_password

  def admin?
    self.role.name == 'admin'
  end

  def get_pupil
    pupils = Pupil.all
    pupils.each do |pupil|
      return pupil if pupil.user == self
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
