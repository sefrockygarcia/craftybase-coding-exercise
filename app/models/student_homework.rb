class StudentHomework < ApplicationRecord
  belongs_to :student, class_name: User.name
  belongs_to :homework
  has_one_attached :file
end
