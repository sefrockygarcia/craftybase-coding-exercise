class Homework < ApplicationRecord
  belongs_to :teacher, class_name: User.name
  has_many :student_homeworks

  scope :by_title, ->(title) {
    where('title LIKE ?', "%#{title}%")
  }

  scope :submitted_between, ->(from_date, to_date) {
    joins(:student_homeworks)
    .where('student_homeworks.submitted_at BETWEEN ? AND ?', from_date, to_date)
  }

  scope :by_student_name, ->(student_name) { 
    joins(student_homeworks: :student)
    .where('users.name LIKE ?', "%#{student_name}%")
  }
end
