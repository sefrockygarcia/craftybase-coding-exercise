class Homework < ApplicationRecord
  belongs_to :teacher, class_name: User.name
  has_many :student_homeworks
end
