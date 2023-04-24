require 'test_helper'
require 'rack/test'

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

  test 'should accept valid attachment' do
    student_homework = student_homeworks(:student_homework_1)
    valid_pdf = Rack::Test::UploadedFile.new('test/fixtures/files/valid.pdf', 'application/pdf')

    student_homework.attachment.attach(valid_pdf)
    assert student_homework.valid?
  end

  test 'should not accept invalid attachment' do
    student_homework = student_homeworks(:student_homework_1)
    invalid_txt = Rack::Test::UploadedFile.new('test/fixtures/files/invalid.txt', 'text/plain')

    student_homework.attachment.attach(invalid_txt)
    assert_not student_homework.valid?
  end
end
