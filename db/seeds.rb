# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Student.create!(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    identification: Faker::Number.unique.number(8),
    number: "#{Faker::Number.unique.number(7)}/#{Faker::Number.digit}"
  )
end

Course.create!(from: Date.new(2012, 3), to: Date.new(2012, 8))
Course.create!(from: Date.new(2012, 8, 2), to: Date.new(2013, 3))
Course.create!(from: Date.new(2014, 3), to: Date.new(2015, 3))
Course.create!(from: Date.new(2015, 3, 2), to: Date.new(2015, 8))

Enrollment.create!(student_id: 1, course_id: 1)
Enrollment.create!(student_id: 1, course_id: 2)
Enrollment.create!(student_id: 2, course_id: 1)
Enrollment.create!(student_id: 3, course_id: 1)
Enrollment.create!(student_id: 4, course_id: 2)
Enrollment.create!(student_id: 5, course_id: 2)
