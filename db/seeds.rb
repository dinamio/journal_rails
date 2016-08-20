# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['admin','teacher','parent'].each do |role|
  Role.find_or_create_by({name: role})
end
admin_role = Role.find_by({name: 'admin'})
parent_role = Role.find_by({name: 'parent'})
#User.delete_all
user = User.find_by(username: 'tanya')
if user == nil 
 user = User.create! :username => 'tanya', :password => 'qwerty', :password_confirmation => 'qwerty'
end
user.role = admin_role
user.save

pupils = Pupil.all
pupils.each do |pupil|
	username = Russian::transliterate(pupil.surname)
	pupil_user = User.find_by(username: username)
	if pupil_user == nil
		pupil_user = User.create! :username => username, :password => username, :password_confirmation => username
	end
	pupil_user.role = parent_role
	pupil_user.save
	pupil.user=pupil_user
	pupil.save
end