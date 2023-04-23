class StudentHomework < ApplicationRecord
  belongs_to :student, class_name: User.name
  belongs_to :homework
  has_one_attached :file

  enum grade: {
    ungraded: 0,
    incomplete: 1,
    A: 2,
    B: 3,
    C: 4,
    D: 5,
    F: 6
  }
end
