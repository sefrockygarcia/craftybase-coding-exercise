# db/seeds.rb

# Create a teacher
teacher = User.create(name: 'Teacher 1', role: :teacher)

# Create students
students = []
(1..6).each do |i|
  student = User.create(name: "Student #{i}", role: :student)
  students << student
end

# Create homework assignments
homework1 = Homework.create(title: 'Homework 1', teacher: teacher)
homework2 = Homework.create(title: 'Homework 2', teacher: teacher)

# Assign homework to students
students.each do |student|
  StudentHomework.create(student: student, homework: homework1, submitted_at: nil, graded_at: nil, attachment: nil, note: nil, grade: nil)
  StudentHomework.create(student: student, homework: homework2, submitted_at: nil, graded_at: nil, attachment: nil, note: nil, grade: nil)
end
