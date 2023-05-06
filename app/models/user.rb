class User < ApplicationRecord
  enum role: { student: 0, teacher: 1 }
  has_many :homeworks, foreign_key: :teacher_id
  has_many :student_homeworks, foreign_key: :student_id
end
