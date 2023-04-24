require 'test_helper'

class StudentHomeworkTest < ActiveSupport::TestCase
  test ".by_grade" do
    student_homework_a = student_homeworks(:student_homework_1)
    student_homework_b = student_homeworks(:student_homework_2)

    result = StudentHomework.by_grade('A')
    assert_includes result, student_homework_a
    refute_includes result, student_homework_b
  end

  test ".by_title" do
    student_homework_1 = student_homeworks(:student_homework_1)
    student_homework_2 = student_homeworks(:student_homework_2)

    result = StudentHomework.by_title('Math')
    assert_includes result, student_homework_1
    refute_includes result, student_homework_2
  end
end
