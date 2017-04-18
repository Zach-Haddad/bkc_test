# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(fname: "John", lname:"Johnson", email:"jjohnson@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Ted", lname:"Smith", email:"tsmith@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Barry", lname:"Abbey", email:"babbey@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Edward", lname:"Brown", email:"ebrown@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Jimmy", lname:"Johnson", email:"jjohnsons@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Sandra", lname:"Williams", email:"swilliams@aol.com", password:"password", password_confirmation:"password")
User.create(fname: "Betsy", lname:"Franklin", email:"bfranklin@aol.com", password:"password", password_confirmation:"password")

Post.create(title:"First Post",
  body:"This is my first post here, please be easy on me!",
  user_id:1)

Comment.create(body:"You are doing great!",
  user_id:2,
  post_id:1)
