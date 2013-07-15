# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 users = User.create([{email: 'sudhirsb2003@gmail.com', first_name: 'Sudhir', last_name: 'Vishwakarma', password: 'sudhirsb', password_confirmation: 'sudhirsb', admin: "true"}])
