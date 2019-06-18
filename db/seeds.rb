# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ :name => "Star Wars" }, { :name => "Lord of the Rings" }])
#   Character.create(:name => "Luke", movie: movies.first)
# course_names = [
#   {"name" => "Algebra 1", "description" => "Beginner Class"},
#   {"name" => "Algebra 2", "description" => "intermediate Algebra"},
#   {"name" => "Geometry", "description" => "Basic Geometry"},
#   {"name" => "Physics", "description" => "Intro to Physics"},
#   {"name" => "Intermediate Math", "description" => "Basic Math"}
# ]
#
# course_names.each do |course|
#   Course.create(coursename: course["name"], description: course["description"])
# end
def main
  make_students
  make_courses
end

def make_students
    30.times do
      Student.create(
        first_name: Faker::Name.male_first_name,
        last_name:  Faker::Name.last_name
      )
    end
end

def make_courses
    10.times do
      Course.create(
        coursename: Faker::Educator.course_name
      )
    end
    Course.all
end

main
