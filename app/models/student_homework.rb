class StudentHomework < ApplicationRecord
  belongs_to :student, class_name: User.name
  belongs_to :homework
  has_one_attached :file

  scope :by_grade, ->(grade) {
    where(grade: grade)
  }

  scope :by_title, ->(title) {
    joins(:homework)
    .where('homeworks.title LIKE ?', "%#{title}%")
  }
end
